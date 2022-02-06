import 'package:flutter/material.dart';
import 'package:og_gamers/constants.dart';

class TournamentTile extends StatelessWidget {
  String? name;
  String? gameName;
  String? coverUrl;

  // ignore: use_key_in_widget_constructors
  TournamentTile(
      {required this.name, required this.gameName, required this.coverUrl});

  @override
  Widget build(BuildContext context) {
    // return ListTile(
    //   title: Text(name!),
    //   subtitle: Text(gameName!),
    // );
    return buildGameCard(name, gameName, coverUrl);
  }
}

Widget buildGameCard(name, gameName, coverUrl) {
  return InkWell(
    onTap: () {},
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.network(
              coverUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
              child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: const Color.fromARGB(73, 0, 0, 0),
            ),
          )),
          Positioned.fill(
            bottom: 0,
            top: 80,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0))),
              // width: 300,

              // padding: const EdgeInsets.symmetric(
              //   vertical: 5,
              //   horizontal: 20,
              // ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      name,
                      style: const TextStyle(
                          fontSize: 15,
                          color: kDarkBlack,
                          fontWeight: FontWeight.bold),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    gameName,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(176, 102, 102, 102),
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
