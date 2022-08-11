import 'package:encyclopedia_star_wars/database/dbhelper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum StateApp {
  characters,
  vehicles,
  planets,
  species,
  starships,
  films,
  loading,
  loadingData,
}

ValueNotifier<StateApp> stateApp = ValueNotifier(StateApp.loading);

final DbHelper dbHelper = DbHelper();
final prefs = SharedPreferences.getInstance();
const valorFactor = 10;
