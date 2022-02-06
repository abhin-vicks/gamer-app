import 'package:flutter/cupertino.dart';
import 'package:og_gamers/models/user_details.dart';

class HomeProvider with ChangeNotifier {
  UserDetails _currentUser = UserDetails(
      id: 0,
      elo: 0,
      ign: "ign",
      name: "name",
      tournamentsPlayed: 0,
      tournamentsWon: 0,
      winningPercentage: "winningPercentage",
      url:
          "https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png");

  UserDetails get currentUser => _currentUser;

  void setCurrentUser(UserDetails ud) {
    _currentUser = ud;
    notifyListeners();
  }
}
