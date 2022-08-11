import 'package:encyclopedia_star_wars/models/film_model.dart';
import 'package:encyclopedia_star_wars/models/specie_model.dart';
import 'package:encyclopedia_star_wars/models/starship_model.dart';
import 'package:encyclopedia_star_wars/models/vehicle_model.dart';

class CharacterModel {
  String id;
  final String name;
  final String height;
  final String mass;
  final String hairColor;
  final String skinColor;
  final String eyeColor;
  final String birthYear;
  final String gender;
  final String homeWorld;
  final List films;
  final List<FilmModel> filmsList;
  final List species;
  final List<SpecieModel> speciesList;
  final List vehicles;
  final List<VehiclesModel> vehiclesList;
  final List starships;
  final List<StarshipsModel> starshipsList;
  final String created;
  final String edited;
  final String url;

  CharacterModel(
      {this.name = "",
      this.id = "",
      this.height = "",
      this.mass = "",
      this.hairColor = "",
      this.skinColor = "",
      this.eyeColor = "",
      this.birthYear = "",
      this.gender = "",
      this.homeWorld = "",
      this.films = const [],
      this.filmsList = const [],
      this.species = const [],
      this.speciesList = const [],
      this.vehicles = const [],
      this.vehiclesList = const [],
      this.starships = const [],
      this.starshipsList = const [],
      this.created = "",
      this.edited = "",
      this.url = ""});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'height': height,
      'mass': mass,
      'hair_color': hairColor,
      'skin_color': skinColor,
      'eye_color': eyeColor,
      'birth_year': birthYear,
      'gender': gender,
      'homeworld': homeWorld,
      // 'films': films,
      // 'species': species,
      // 'vehicles': vehicles,
      // 'starships': starships,
      'created': created,
      'edited': edited,
      'url': url,
    };
  }

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      name: json['name'],
      height: json['height'],
      mass: json['mass'],
      hairColor: json['hair_color'],
      skinColor: json['skin_color'],
      eyeColor: json['eye_color'],
      birthYear: json['birth_year'],
      gender: json['gender'],
      homeWorld: json['homeworld'],
      films: json['films'],
      species: json['species'],
      vehicles: json['vehicles'],
      starships: json['starships'],
      created: json['created'],
      edited: json['edited'],
      url: json['url'],
    );
  }
}
