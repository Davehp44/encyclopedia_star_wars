import 'package:encyclopedia_star_wars/constants/constants.dart';

Future<String> getStringPreferences(String name, String value) async {
  await prefs.then((v) => {
        if (v.getString(name) != null) {value = v.getString(name)!}
      });
  return value;
}

Future<void> setStringPreferences(String name, String value) async {
  await prefs.then((v) => {v.setString(name, value)});
}
