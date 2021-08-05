import 'package:sign_writing/main.dart';

class PreferencesKey {
  static const String LANGUAGE = "language";
  static const String SHOW_INTRO = "show_intro";
  static const String GAME_GROUPS = "game_groups";
}

const DEFAULT_SYSTEM_LANGUAGE = 'de';

Object getSystemSetting(key) {
  return prefs.get(key);
}

void setSystemSetting(key, val) {
  if (val is bool)
    prefs.setBool(key, val);
  else if (val is int)
    prefs.setInt(key, val);
  else if (val is List)
    prefs.setStringList(key, val);
  else
    prefs.setString(key, val);
    
  SystemSettings.setValue(key, val);
}

void setSystemSettingListItem(key, val, isAdd) {
  List<String> lst = prefs.getStringList(key);
  
  lst.remove(val);

  if (isAdd) { lst.add(val); }

  prefs.setStringList(key, lst);
  SystemSettings.setValue(key, lst);
}

Object getSystemSettingOrDefault(key, def) {
  if (!prefs.containsKey(key)) 
    setSystemSetting(key, def);
    
  return getSystemSetting(key);
}

class SystemSettings {
  static String language;
  static bool showIntro;
  static List<String> gameGroups;

  static void setValue(key, val) {
    switch (key) {
      case PreferencesKey.LANGUAGE : language = val; break;
      case PreferencesKey.SHOW_INTRO : showIntro = val; break;
      case PreferencesKey.GAME_GROUPS : gameGroups = val; break;
      default : break;
    }
  }
}