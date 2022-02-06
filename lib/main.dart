import 'package:flutter/material.dart';

import 'screens/og_app.dart';
import 'services/shared_preference_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Pref.init();
  // Pref.clear();
  runApp(const OgApp());
}
