import 'package:flutter/material.dart';
import 'package:og_gamers/models/user_details.dart';
import 'package:og_gamers/providers/home_provider.dart';
import 'package:og_gamers/widgets/home/user_card.dart';
import 'package:og_gamers/widgets/home/row_info.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../widgets/home/app_drawer.dart';
import '../widgets/home/tournament_list.dart';

class HomeScreen extends StatefulWidget {
  final String id;
  const HomeScreen(this.id, {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<HomeScreen> createState() => _HomeScreenState(id);
}

class _HomeScreenState extends State<HomeScreen> {
  final String id;
  late HomeProvider hp;

  _HomeScreenState(this.id);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hp = Provider.of<HomeProvider>(context, listen: false);
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      //! Load Initial data
      getUserDetails();
    });
  }

  void getUserDetails() {
    UserDetails user = UserDetails.getUser(int.parse(id));
    hp.setCurrentUser(user);
  }

  @override
  Widget build(BuildContext context) {
    UserDetails user = Provider.of<HomeProvider>(context).currentUser;

    return Scaffold(
      drawer: AppDrawer(),
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(240, 249, 249, 249),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: kDarkBlack,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        elevation: 0,
        title: Text(
          user.ign,
          style:
              const TextStyle(color: kDarkBlack, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const UserCard(),
                const SizedBox(
                  height: 20,
                ),
                RowInfo(
                    [user.tournamentsPlayed.toString(), "Tournaments played"],
                    [user.tournamentsWon.toString(), "Tournaments won"],
                    [user.winningPercentage, "Winning percentage"]),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Recommened for you",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: kDarkBlack,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TournamentList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
