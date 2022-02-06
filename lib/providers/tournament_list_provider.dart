import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:og_gamers/models/tournaments_response.dart';

class TournamentListProvider extends ChangeNotifier {
  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;
  bool _hasNextPage = true;
  // ignore: prefer_final_fields
  List<Tournaments> _tournaments = [];
  String _cursor = "";
  final _url =
      "http://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/tournaments_list_v2?limit=10&status=all";

  List<Tournaments> get tournaments => _tournaments;
  bool get isFirstLoadRunning => _isFirstLoadRunning;
  bool get isLoadMoreRunning => _isLoadMoreRunning;
  bool get hasNextPage => _hasNextPage;

  void loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false) {
      isLoadingMore(true);
      try {
        final res = await http.get(Uri.parse("$_url&cursor=$_cursor"));
        var response = json.decode(res.body);
        TournamentsResponse tr = TournamentsResponse.fromJson(response);
        final List<Tournaments>? fetchedTournaments = tr.data?.tournaments;
        if (fetchedTournaments != null && fetchedTournaments.isNotEmpty) {
          _cursor = tr.data!.cursor!;
          updateTournaments(fetchedTournaments);
        } else {
          _hasNextPage = false;
        }
        isLoadingMore(false);
        // ignore: empty_catches
      } catch (err) {}
    }
  }

  void isLoadingMore(loadStatus) {
    _isLoadMoreRunning = loadStatus;
    notifyListeners();
  }

  void updateTournaments(List<Tournaments> newTournaments) {
    _tournaments.addAll(newTournaments);
    notifyListeners();
  }

  void isLoadingIntial(initialLoadStatus) {
    _isFirstLoadRunning = initialLoadStatus;
  }

  void initialLoad() async {
    isLoadingIntial(true);
    try {
      final res = await http.get(Uri.parse("$_url&cursor=$_cursor"));
      var response = json.decode(res.body);
      TournamentsResponse tr = TournamentsResponse.fromJson(response);

      final List<Tournaments>? fetchedTournaments = tr.data?.tournaments;
      _cursor = tr.data!.cursor!;
      updateTournaments(fetchedTournaments!);
      // ignore: empty_catches
    } catch (err) {}
    isLoadingIntial(false);
  }
}
