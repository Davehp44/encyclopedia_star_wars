class SpecieModel {
  final String id;
  final String name;
  final String classification;
  final String designation;
  final String averageHeight;
  final String skinColors;
  final String hairColors;
  final String eyeColors;
  final String averageLifespan;
  final String? homeWorld;
  final String language;
  final List people;
  final List films;
  final String created;
  final String edited;
  final String url;

  SpecieModel(
      {this.classification = "",
      this.designation = "",
      this.averageHeight = "",
      this.hairColors = "",
      this.averageLifespan = "",
      this.language = "",
      this.people = const [],
      this.name = "",
      this.id = "",
      this.skinColors = "",
      this.eyeColors = "",
      this.homeWorld = "",
      this.films = const [],
      this.created = "",
      this.edited = "",
      this.url = ""});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'classification': classification,
      'designation': designation,
      'average_height': averageHeight,
      'skin_colors': skinColors,
      'hair_colors': hairColors,
      'eye_colors': eyeColors,
      'average_lifespan': averageLifespan,
      'homeworld': homeWorld,
      'language': language,
      'people': people,
      'films': films,
      'created': created,
      'edited': edited,
      'url': url,
    };
  }

  factory SpecieModel.fromJson(Map<String, dynamic> json) {
    return SpecieModel(
      name: json['name'],
      classification: json['classification'],
      designation: json['designation'],
      averageHeight: json['average_height'],
      skinColors: json['skin_colors'],
      hairColors: json['hair_colors'],
      eyeColors: json['eye_colors'],
      averageLifespan: json['average_lifespan'],
      homeWorld: json['homeworld'],
      language: json['language'],
      people: json['people'],
      films: json['films'],
      created: json['created'],
      edited: json['edited'],
      url: json['url'],
    );
  }
}
