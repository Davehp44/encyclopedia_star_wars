class FilmModel {
  final String id;
  final String title;
  final int episodeId;
  final String openingCrawl;
  final String director;
  final String producer;
  final String releaseDate;
  final List characters;
  final List planets;
  final List species;
  final List vehicles;
  final List starships;
  final String created;
  final String edited;
  final String url;

  FilmModel(
      {this.title = "",
      this.id = "",
      this.episodeId = 0,
      this.openingCrawl = "",
      this.director = "",
      this.producer = "",
      this.releaseDate = "",
      this.characters = const [],
      this.planets = const [],
      this.species = const [],
      this.vehicles = const [],
      this.starships = const [],
      this.created = "",
      this.edited = "",
      this.url = ""});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'episode_id': episodeId,
      'opening_crawl': openingCrawl,
      'director': director,
      'producer': producer,
      'release_date': releaseDate,
      'characters': characters,
      'planets': planets,
      'species': species,
      'vehicles': vehicles,
      'starships': starships,
      'created': created,
      'edited': edited,
      'url': url,
    };
  }

  factory FilmModel.fromJson(Map<String, dynamic> json) {
    return FilmModel(
      title: json['title'],
      episodeId: json['episode_id'],
      openingCrawl: json['opening_crawl'],
      director: json['director'],
      producer: json['producer'],
      releaseDate: json['release_date'],
      characters: json['characters'],
      planets: json['planets'],
      species: json['species'],
      vehicles: json['vehicles'],
      starships: json['starships'],
      created: json['created'],
      edited: json['edited'],
      url: json['url'],
    );
  }
}
