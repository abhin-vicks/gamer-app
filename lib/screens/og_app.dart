import 'package:flutter/material.dart';
import 'package:og_gamers/providers/home_provider.dart';
import 'package:og_gamers/providers/tournament_list_provider.dart';
import 'package:og_gamers/screens/landing_screen.dart';
import 'package:provider/provider.dart';

import '../routes/custom_routes.dart';

class OgApp extends StatelessWidget {
  const OgApp({Key? key}) : super(key: key);

  // This widget is the root of this application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider<TournamentListProvider>(
          create: (context) => TournamentListProvider(),
        ),
      ],
      child: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LandingScreen(),
      onGenerateRoute: CustomRouters.generateRoute,
    );
  }
}
