import 'package:flutter/material.dart';
import 'package:og_gamers/routes/route_name.dart';
import 'package:og_gamers/services/shared_preference_service.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              title: Row(
                children: const <Widget>[
                  Icon(Icons.logout),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text("Logout"),
                  )
                ],
              ),
              onTap: () {
                Pref.clear();
                Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
              },
            )
          ],
        ),
      ),
    );
  }
}
