import 'package:flutter/material.dart';
import 'package:og_gamers/providers/tournament_list_provider.dart';
import 'package:provider/provider.dart';

import 'tournament_tile.dart';

class TournamentList extends StatefulWidget {
  const TournamentList({Key? key}) : super(key: key);

  @override
  _TournamentListState createState() => _TournamentListState();
}

class _TournamentListState extends State<TournamentList> {
  late TournamentListProvider _tp;
  late ScrollController _controller;

  void _loadMore() {
    if (_controller.position.extentAfter < 300) {
      _tp.loadMore();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tp = Provider.of<TournamentListProvider>(context, listen: false);
    _tp.initialLoad();
    _controller = ScrollController();
    _controller.addListener(_loadMore);
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TournamentListProvider>(builder: (_, tlp, __) {
      return tlp.isFirstLoadRunning
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ListView.builder(
                      controller: _controller,
                      itemCount: tlp.tournaments.length,
                      itemBuilder: (_, index) => TournamentTile(
                            name: tlp.tournaments[index].name,
                            gameName: tlp.tournaments[index].gameName,
                            coverUrl: tlp.tournaments[index].coverUrl,
                          )),
                ),
                if (tlp.isLoadMoreRunning)
                  const Positioned(
                    bottom: 2.0,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 40),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                if (!tlp.hasNextPage)
                  Container(
                    padding: const EdgeInsets.only(top: 30, bottom: 40),
                    color: Colors.amber,
                    child: const Center(
                      child: Text('You have fetched all of the content'),
                    ),
                  ),
              ],
            );
    });
  }
}
