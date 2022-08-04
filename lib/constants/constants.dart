import 'package:flutter/material.dart';

enum StateApp { characters, vehicles, planets, species, starships, films }

ValueNotifier<StateApp> stateApp = ValueNotifier(StateApp.characters);
