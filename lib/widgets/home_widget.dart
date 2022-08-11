import 'package:encyclopedia_star_wars/constants/constants.dart';
import 'package:encyclopedia_star_wars/constants/stringValues.dart';
import 'package:encyclopedia_star_wars/widgets/characters_widget.dart';
import 'package:encyclopedia_star_wars/widgets/custom_animated_bottom_bar.dart';
import 'package:encyclopedia_star_wars/widgets/films_widget.dart';
import 'package:encyclopedia_star_wars/widgets/loading_view_widget.dart';
import 'package:encyclopedia_star_wars/widgets/planets_widget.dart';
import 'package:encyclopedia_star_wars/widgets/species_widget.dart';
import 'package:encyclopedia_star_wars/widgets/startship_widget.dart';
import 'package:encyclopedia_star_wars/widgets/vehicles_widget.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _selectedIndex = 0;
  CharactersWidget charactersWidget = const CharactersWidget();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        stateApp.value = StateApp.characters;
      } else if (index == 1) {
        stateApp.value = StateApp.species;
      } else {
        showModalBottomSheet(
          context: context,
          builder: (context) => SafeArea(
              bottom: true,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: const Text(planets),
                    ),
                    onTap: () {
                      stateApp.value = StateApp.planets;
                      setState(() {});
                      Navigator.pop(context);
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: const Text(vehicles),
                    ),
                    onTap: () {
                      stateApp.value = StateApp.vehicles;
                      setState(() {});
                      Navigator.pop(context);
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: const Text(starships),
                    ),
                    onTap: () {
                      stateApp.value = StateApp.starships;
                      setState(() {});
                      Navigator.pop(context);
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: const Text(films),
                    ),
                    onTap: () {
                      stateApp.value = StateApp.films;
                      setState(() {});
                      Navigator.pop(context);
                    },
                  ),
                ],
              )),
        ).whenComplete(() {
          if (stateApp.value == StateApp.characters) {
            _selectedIndex = 0;
          } else if (stateApp.value == StateApp.species) {
            _selectedIndex = 1;
          }
          setState(() {});
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: stateApp,
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: stateApp.value != StateApp.loading
            ? AppBar(
                title: Text(
                  stateApp.value == StateApp.characters
                      ? characters
                      : stateApp.value == StateApp.vehicles
                          ? vehicles
                          : stateApp.value == StateApp.planets
                              ? planets
                              : stateApp.value == StateApp.species
                                  ? species
                                  : stateApp.value == StateApp.starships
                                      ? starships
                                      : stateApp.value == StateApp.films
                                          ? films
                                          : "",
                ),
                centerTitle: true,
              )
            : null,
        bottomNavigationBar:
            stateApp.value != StateApp.loading ? _buildBottomBar() : null,
        body: stateApp.value == StateApp.characters
            ? charactersWidget
            : stateApp.value == StateApp.vehicles
                ? const VehiclesWidget()
                : stateApp.value == StateApp.planets
                    ? const PlanetWidget()
                    : stateApp.value == StateApp.species
                        ? const SpeciesWidget()
                        : stateApp.value == StateApp.starships
                            ? const StarShipsWidget()
                            : stateApp.value == StateApp.films
                                ? const FilmsWidget()
                                : const LoadingViewWidget(),
      ),
    );
  }

  final _inactiveColor = Colors.grey;

  Widget _buildBottomBar() {
    return CustomAnimatedBottomBar(
      containerHeight: 50,
      backgroundColor: Colors.white,
      selectedIndex: _selectedIndex,
      showElevation: true,
      itemCornerRadius: 10,
      curve: Curves.easeInOut,
      onItemSelected: (index) => _onItemTapped(index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: const Icon(Icons.people),
          title: const Text(characters),
          activeColor: Colors.blue,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.adb),
          title: const Text(species),
          activeColor: Colors.blue,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.menu),
          title: const Text(others),
          activeColor: Colors.blue,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
