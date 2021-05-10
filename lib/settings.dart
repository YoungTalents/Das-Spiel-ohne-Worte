import 'package:sign_writing/main.dart';

class PreferencesKey {
  static const String LANGUAGE = "language";
  static const String SHOW_INTRO = "show_intro";
}

const DEFAULT_SYSTEM_LANGUAGE = 'DE';

Object getSystemSetting(key) {
  return prefs.get(key);
}

void setSystemSetting(key, val) {
  if (val is bool)
    prefs.setBool(key, val);
  else if (val is int)
    prefs.setInt(key, val);
  else 
    prefs.setString(key, val);

  SystemSettings.setValue(key, val);
}

Object getSystemSettingOrDefault(key, def) {
  if (!prefs.containsKey(key)) 
    setSystemSetting(key, def);
    
  return getSystemSetting(key);
}

class SystemSettings {
  static String language;
  static bool showIntro;

  static void setValue(key, val) {
    switch (key) {
      case "language" : language = val; break;
      case "show_intro" : showIntro = val; break;
      default : break;
    }
  }
}