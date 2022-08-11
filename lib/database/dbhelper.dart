import 'dart:io';

import 'package:encyclopedia_star_wars/models/character_model.dart';
import 'package:encyclopedia_star_wars/models/film_model.dart';
import 'package:encyclopedia_star_wars/models/planet_model.dart';
import 'package:encyclopedia_star_wars/models/specie_model.dart';
import 'package:encyclopedia_star_wars/models/starship_model.dart';
import 'package:encyclopedia_star_wars/models/vehicle_model.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  late final Database db;

  Future initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "database.db");

    final exist = await databaseExists(path);

    if (!exist) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}
      ByteData data = await rootBundle.load(join("assets", "database.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }
    await openDatabase(path).then((value) => db = value);
  }

//-----------------characters

  Future<List<CharacterModel>> getCharacters(int limit, int offset) async {
    final List<Map<String, dynamic>> maps =
        await db.query('characters', limit: limit, offset: offset);

    return List.generate(maps.length, (i) {
      return CharacterModel(
        id: maps[i]['id'],
        name: maps[i]['name'],
        height: maps[i]['height'],
        mass: maps[i]['mass'],
        hairColor: maps[i]['hair_color'],
        skinColor: maps[i]['skin_color'],
        eyeColor: maps[i]['eye_color'],
        birthYear: maps[i]['birth_year'],
        gender: maps[i]['gender'],
        homeWorld: maps[i]['homeworld'],
        created: maps[i]['created'],
        edited: maps[i]['edited'],
        url: maps[i]['url'],
      );
    });
  }

  Future<int> countCharacters(int defaultInt) async {
    int? count = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM characters'));
    return count ?? defaultInt;
  }

  Future<void> insertCharacter(CharacterModel characterModel) async {
    await db.insert(
      'characters',
      characterModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteCharacters() async {
    await db.delete(
      'characters',
    );
  }

//-----------------species

  Future<List<SpecieModel>> getSpecies(int limit, int offset) async {
    final List<Map<String, dynamic>> maps =
        await db.query('species', limit: limit, offset: offset);

    return List.generate(maps.length, (i) {
      return SpecieModel(
        id: maps[i]['id'],
        name: maps[i]['name'],
        classification: maps[i]['classification'],
        designation: maps[i]['designation'],
        averageHeight: maps[i]['average_height'],
        skinColors: maps[i]['skin_colors'],
        eyeColors: maps[i]['eye_colors'],
        hairColors: maps[i]['hair_colors'],
        averageLifespan: maps[i]['average_lifespan'],
        homeWorld: maps[i]['homeworld'],
        language: maps[i]['language'],
        created: maps[i]['created'],
        edited: maps[i]['edited'],
        url: maps[i]['url'],
      );
    });
  }

  Future<int> countSpecies(int defaultInt) async {
    int? count = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM species'));
    return count ?? defaultInt;
  }

  Future<void> insertSpecie(SpecieModel specieModel) async {
    await db.insert(
      'species',
      specieModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteSpecies() async {
    await db.delete(
      'species',
    );
  }

//-----------------planets

  Future<List<PlanetModel>> getPlanets(int limit, int offset) async {
    final List<Map<String, dynamic>> maps =
        await db.query('planets', limit: limit, offset: offset);

    return List.generate(maps.length, (i) {
      return PlanetModel(
        id: maps[i]['id'],
        name: maps[i]['name'],
        rotationPeriod: maps[i]['rotation_period'],
        orbitalPeriod: maps[i]['orbital_period'],
        diameter: maps[i]['diameter'],
        climate: maps[i]['climate'],
        gravity: maps[i]['gravity'],
        terrain: maps[i]['terrain'],
        surfaceWater: maps[i]['surface_water'],
        population: maps[i]['population'],
        created: maps[i]['created'],
        edited: maps[i]['edited'],
        url: maps[i]['url'],
      );
    });
  }

  Future<int> countPlanets(int defaultInt) async {
    int? count = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM planets'));
    return count ?? defaultInt;
  }

  Future<void> insertPlanet(PlanetModel planetModel) async {
    await db.insert(
      'planets',
      planetModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deletePlanet() async {
    await db.delete(
      'planets',
    );
  }

//-----------------vehicles

  Future<List<VehiclesModel>> getVehicles(int limit, int offset) async {
    final List<Map<String, dynamic>> maps =
        await db.query('vehicles', limit: limit, offset: offset);

    return List.generate(maps.length, (i) {
      return VehiclesModel(
        id: maps[i]['id'],
        name: maps[i]['name'],
        model: maps[i]['model'],
        manufacturer: maps[i]['manufacturer'],
        costInCredits: maps[i]['cost_in_credits'],
        length: maps[i]['length'],
        maxAtmospheringSpeed: maps[i]['max_atmosphering_speed'],
        crew: maps[i]['crew'],
        passengers: maps[i]['passengers'],
        cargoCapacity: maps[i]['cargo_capacity'],
        consumables: maps[i]['consumables'],
        vehicleClass: maps[i]['vehicle_class'],
        created: maps[i]['created'],
        edited: maps[i]['edited'],
        url: maps[i]['url'],
      );
    });
  }

  Future<int> countVehicles(int defaultInt) async {
    int? count = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM vehicles'));
    return count ?? defaultInt;
  }

  Future<void> insertVehicle(VehiclesModel vehiclesModel) async {
    await db.insert(
      'vehicles',
      vehiclesModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteVehicles() async {
    await db.delete(
      'vehicles',
    );
  }
//-----------------Starships

  Future<List<StarshipsModel>> getStarships(int limit, int offset) async {
    final List<Map<String, dynamic>> maps =
        await db.query('starships', limit: limit, offset: offset);

    return List.generate(maps.length, (i) {
      return StarshipsModel(
        id: maps[i]['id'],
        name: maps[i]['name'],
        model: maps[i]['model'],
        manufacturer: maps[i]['manufacturer'],
        costInCredits: maps[i]['cost_in_credits'],
        length: maps[i]['length'],
        maxAtmospheringSpeed: maps[i]['max_atmosphering_speed'],
        crew: maps[i]['crew'],
        passengers: maps[i]['passengers'],
        cargoCapacity: maps[i]['cargo_capacity'],
        consumables: maps[i]['consumables'],
        hyperDriveRating: maps[i]['hyperdrive_rating'],
        MGLT: maps[i]['MGLT'],
        starshipClass: maps[i]['starship_class'],
        created: maps[i]['created'],
        edited: maps[i]['edited'],
        url: maps[i]['url'],
      );
    });
  }

  Future<int> countStarships(int defaultInt) async {
    int? count = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM starships'));
    return count ?? defaultInt;
  }

  Future<void> insertStarship(StarshipsModel starshipsModel) async {
    await db.insert(
      'starships',
      starshipsModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteStarships() async {
    await db.delete(
      'starships',
    );
  }
//-----------------Starships

  Future<List<FilmModel>> getFilms(int limit, int offset) async {
    final List<Map<String, dynamic>> maps =
        await db.query('films', limit: limit, offset: offset);

    return List.generate(maps.length, (i) {
      return FilmModel(
        id: maps[i]['id'],
        title: maps[i]['title'],
        episodeId: int.parse(maps[i]['episode_id']),
        openingCrawl: maps[i]['opening_crawl'],
        director: maps[i]['director'],
        producer: maps[i]['producer'],
        releaseDate: maps[i]['release_date'],
        created: maps[i]['created'],
        edited: maps[i]['edited'],
        url: maps[i]['url'],
      );
    });
  }

  Future<int> countFilms(int defaultInt) async {
    int? count =
        Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM films'));
    return count ?? defaultInt;
  }

  Future<void> insertFilms(FilmModel filmModel) async {
    await db.insert(
      'films',
      filmModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteFilms() async {
    await db.delete(
      'films',
    );
  }
}
