import 'package:SignWriting/pages/intro.dart';
import 'package:SignWriting/pages/main_menu.dart';
import 'package:SignWriting/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences prefs;

Future<void> main() async {  
  WidgetsFlutterBinding.ensureInitialized();
  await loadSettings();
  SystemChrome.setEnabledSystemUIOverlays([]);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

Future<void> loadSettings() async {
  prefs = await SharedPreferences.getInstance();
  SystemSettings.language = getSystemSettingOrDefault(PreferencesKey.LANGUAGE, DEFAULT_SYSTEM_LANGUAGE);
  SystemSettings.showIntro = getSystemSettingOrDefault(PreferencesKey.SHOW_INTRO, true);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Das Spiel',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SystemSettings.showIntro ? Intro() : MainMenu(),
    );
  }
}