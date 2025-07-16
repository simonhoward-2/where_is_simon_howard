import 'dart:math' as Math;

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:locations_history_browser/locations_history_browser.dart';
import 'package:where_is_simon_howard/app_config.dart';
import 'package:where_is_simon_howard/simons_visits.dart';

void main() async {
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables from .env file
  await dotenv.load(fileName: "env");

  // Run the app
  runApp(const WebApp());
}

class WebApp extends StatelessWidget {
  const WebApp({super.key});

  @override
  Widget build(BuildContext context) {
    const websiteColor = Color(0xFF6D70DC);

    return MaterialApp(
      title: 'Where in the world is Simon Howard?',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: websiteColor,
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        body: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700, maxHeight: 700),
            child: Align(
              alignment: Alignment.center,
              child: LocationsHistoryBrowser(
                mapsUrlTemplate: AppConfig.mapsUrlTemplate,
                locationVisits: simonsVisits,
                style: LocationsHistoryBrowserStyle(
                  selectedLocationBackgroundColor: Colors.black,
                  locationVisitBackgroundColor: websiteColor,
                  locationVisitTextColor: Colors.white,
                  selectedLocationTextColor: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
