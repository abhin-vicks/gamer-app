import 'package:flutter/material.dart';
import 'package:og_gamers/constants.dart';
import 'package:og_gamers/providers/home_provider.dart';

import '../../models/user_details.dart';
import 'package:provider/provider.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserDetails user = Provider.of<HomeProvider>(context).currentUser;

    return SizedBox(
      // color: Colors.amber,
      height: 100,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(user.url),
            radius: 45,
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(user.name,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: kDarkBlack),
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: kPurpleBlue),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Text(
                      user.elo.toString(),
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kPurpleBlue),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 16.0),
                      child: const Text(
                        "Elo rating",
                        style:
                            TextStyle(color: Color.fromARGB(255, 0, 71, 129)),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
