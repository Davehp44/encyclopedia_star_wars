class PlanetModel {
  String id;
  final String name;
  final String rotationPeriod;
  final String orbitalPeriod;
  final String diameter;
  final String climate;
  final String gravity;
  final String terrain;
  final String surfaceWater;
  final String population;
  final List residents;
  final List films;
  final String created;
  final String edited;
  final String url;

  PlanetModel(
      {this.id = "",
      this.name = "",
      this.rotationPeriod = "",
      this.orbitalPeriod = "",
      this.diameter = "",
      this.climate = "",
      this.gravity = "",
      this.terrain = "",
      this.surfaceWater = "",
      this.population = "",
      this.residents = const [],
      this.films = const [],
      this.created = "",
      this.edited = "",
      this.url = ""});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'rotation_period': rotationPeriod,
      'orbital_period': orbitalPeriod,
      'diameter': diameter,
      'climate': climate,
      'gravity': gravity,
      'terrain': terrain,
      'surface_water': surfaceWater,
      'population': population,
      // 'residents': residents,
      // 'films': films,
      'created': created,
      'edited': edited,
      'url': url,
    };
  }

  factory PlanetModel.fromJson(Map<String, dynamic> json) {
    return PlanetModel(
      name: json['name'],
      rotationPeriod: json['rotation_period'],
      orbitalPeriod: json['orbital_period'],
      diameter: json['diameter'],
      climate: json['climate'],
      gravity: json['gravity'],
      terrain: json['terrain'],
      surfaceWater: json['surface_water'],
      population: json['population'],
      residents: json['residents'],
      films: json['films'],
      created: json['created'],
      edited: json['edited'],
      url: json['url'],
    );
  }
}
