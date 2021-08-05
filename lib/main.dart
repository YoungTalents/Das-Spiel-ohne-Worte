import 'package:sign_writing/pages/intro.dart';
// import 'package:sign_writing/pages/main_menu.dart';
import 'package:sign_writing/pages/the_game.dart';
import 'package:sign_writing/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  SystemSettings.gameGroups = getSystemSettingOrDefault(PreferencesKey.GAME_GROUPS, ["BASIC"]);
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();

  static MyAppState of(BuildContext context) => context.findAncestorStateOfType<MyAppState>();
}

class MyAppState extends State<MyApp> {
  
  Locale appLocale;

  @override
  void initState() {
    super.initState();
    appLocale = Locale(SystemSettings.language);
  }

  void setLocale(Locale newLocale) {
    setState(() {
      setSystemSetting(PreferencesKey.LANGUAGE, newLocale.languageCode);
      appLocale = newLocale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(height:900, width:1500, 
    child: MaterialApp(
      locale: appLocale,
      onGenerateTitle: (BuildContext context) => AppLocalizations.of(context).appTitle,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), 
        Locale('de', ''), 
      ],
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SystemSettings.showIntro ? Intro() : TheGame(),
    ));
  }
}