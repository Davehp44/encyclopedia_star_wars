import 'dart:async';
import 'dart:convert';

import 'package:encyclopedia_star_wars/constants/constants.dart';
import 'package:encyclopedia_star_wars/constants/stringValues.dart';
import 'package:encyclopedia_star_wars/models/character_model.dart';
import 'package:encyclopedia_star_wars/models/film_model.dart';
import 'package:encyclopedia_star_wars/models/planet_model.dart';
import 'package:encyclopedia_star_wars/models/request_model.dart';
import 'package:encyclopedia_star_wars/models/specie_model.dart';
import 'package:encyclopedia_star_wars/models/starship_model.dart';
import 'package:encyclopedia_star_wars/models/vehicle_model.dart';
import 'package:encyclopedia_star_wars/tools/tools.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class LoadingViewWidget extends StatefulWidget {
  const LoadingViewWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return StateLoadingViewWidget();
  }
}

class StateLoadingViewWidget extends State<LoadingViewWidget> {
  var loadingText = ValueNotifier(0.0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      String sdp = "";
      await getStringPreferences(syncDatePreferences,
              DateTime.now().add(const Duration(days: -7)).toString())
          .then((value) {
        sdp = value;
      });
      DateTime dts = DateTime.parse(sdp);

      if (dts.add(const Duration(days: 7)).isAfter(DateTime.now())) {
        loadingText.value = 1.0;
        await dbHelper
            .initDb()
            .whenComplete(() => Timer(const Duration(seconds: 2), () {
                  stateApp.value = StateApp.characters;
                }));
      } else {
        await dbHelper.initDb().whenComplete(() async {
          fetchCharacterListRequestModel('https://swapi.dev/api/people/')
              .then((requestModel) async {
            if (requestModel != null) {
              if (requestModel.countElement == requestModel.results.length) {
                await dbHelper.deleteCharacters();
              }
              for (var element in requestModel.results) {
                CharacterModel characterModel =
                    CharacterModel.fromJson(element);
                characterModel.id =
                    base64.encode(utf8.encode(characterModel.name));
                await dbHelper.insertCharacter(characterModel);
              }
            }
            loadingText.value = 0.2;
            fetchCharacterListRequestModel('https://swapi.dev/api/species/')
                .then((requestModel) async {
              if (requestModel != null) {
                if (requestModel.countElement == requestModel.results.length) {
                  await dbHelper.deleteSpecies();
                }
                for (var element in requestModel.results) {
                  SpecieModel specieModel = SpecieModel.fromJson(element);
                  specieModel.id = base64.encode(utf8.encode(specieModel.name));
                  await dbHelper.insertSpecie(specieModel);
                }
              }
              loadingText.value = 0.4;
              fetchCharacterListRequestModel('https://swapi.dev/api/planets/')
                  .then((requestModel) async {
                if (requestModel != null) {
                  if (requestModel.countElement ==
                      requestModel.results.length) {
                    await dbHelper.deletePlanet();
                  }
                  for (var element in requestModel.results) {
                    PlanetModel specieModel = PlanetModel.fromJson(element);
                    specieModel.id =
                        base64.encode(utf8.encode(specieModel.name));
                    await dbHelper.insertPlanet(specieModel);
                  }
                }
                loadingText.value = 0.6;
                fetchCharacterListRequestModel(
                        'https://swapi.dev/api/vehicles/')
                    .then((requestModel) async {
                  if (requestModel != null) {
                    if (requestModel.countElement ==
                        requestModel.results.length) {
                      await dbHelper.deleteVehicles();
                    }
                    for (var element in requestModel.results) {
                      VehiclesModel vehiclesModel =
                          VehiclesModel.fromJson(element);
                      vehiclesModel.id =
                          base64.encode(utf8.encode(vehiclesModel.name));
                      await dbHelper.insertVehicle(vehiclesModel);
                    }
                  }
                  loadingText.value = 0.8;
                  fetchCharacterListRequestModel(
                          'https://swapi.dev/api/starships/')
                      .then((requestModel) async {
                    if (requestModel != null) {
                      if (requestModel.countElement ==
                          requestModel.results.length) {
                        await dbHelper.deleteStarships();
                      }
                      for (var element in requestModel.results) {
                        StarshipsModel starshipsModel =
                            StarshipsModel.fromJson(element);
                        starshipsModel.id =
                            base64.encode(utf8.encode(starshipsModel.name));
                        await dbHelper.insertStarship(starshipsModel);
                      }
                    }
                    loadingText.value = 0.9;
                    fetchCharacterListRequestModel(
                            'https://swapi.dev/api/films/')
                        .then((requestModel) async {
                      if (requestModel != null) {
                        if (requestModel.countElement ==
                            requestModel.results.length) {
                          await dbHelper.deleteFilms();
                        }
                        for (var element in requestModel.results) {
                          FilmModel filmModel = FilmModel.fromJson(element);
                          filmModel.id =
                              base64.encode(utf8.encode(filmModel.title));
                          await dbHelper.insertFilms(filmModel);
                        }
                      }
                      loadingText.value = 0.99;
                      await setStringPreferences(
                          syncDatePreferences, DateTime.now().toString());
                      Timer(const Duration(seconds: 1), () {
                        stateApp.value = StateApp.characters;
                      });
                    });
                  });
                });
              });
            });
          });
        });
      }
    });
  }

  Future<RequestModel?> fetchCharacterListRequestModel(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var characterListRequestModel =
            RequestModel.fromJson(jsonDecode(response.body));
        if (characterListRequestModel.next != null) {
          await fetchCharacterListRequestModel(characterListRequestModel.next!)
              .then((value) {
            if (value != null) {
              characterListRequestModel.results.addAll(value.results);
            }
          });
        }
        return characterListRequestModel;
      } else {
        return null;
      }
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
            child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: Image.asset("assets/images/loading.gif"),
          ),
        )),
        Container(
          height: 100,
          padding: const EdgeInsets.all(20),
          child: ValueListenableBuilder(
            valueListenable: loadingText,
            builder: (context, value, child) => LiquidLinearProgressIndicator(
              direction: Axis.horizontal,
              backgroundColor: Colors.white,
              value: loadingText.value,
              borderRadius: 10,
              center: Text(loadingText.value == 0.0
                  ? 'loading $characters'
                  : loadingText.value == 0.2
                      ? 'loading $species'
                      : loadingText.value == 0.4
                          ? 'loading $planets'
                          : loadingText.value == 0.6
                              ? 'loading $vehicles'
                              : loadingText.value == 0.8
                                  ? 'loading $starships'
                                  : loadingText.value == 0.9
                                      ? 'loading $films'
                                      : loadingText.value == 1.0
                                          ? 'loading Data'
                                          : 'Save Data'),
              valueColor: const AlwaysStoppedAnimation(Colors.blue),
            ),
          ),
        )
      ],
    );
  }
}
