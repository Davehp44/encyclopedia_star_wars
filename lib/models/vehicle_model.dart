class VehiclesModel {
  final String id;
  final String name;
  final String model;
  final String manufacturer;
  final String costInCredits;
  final String length;
  final String maxAtmospheringSpeed;
  final String crew;
  final String passengers;
  final String cargoCapacity;
  final String consumables;
  final String vehicleClass;
  final List pilots;
  final List films;
  final String created;
  final String edited;
  final String url;

  VehiclesModel(
      {this.id = "",
      this.name = "",
      this.model = "",
      this.manufacturer = "",
      this.costInCredits = "",
      this.length = "",
      this.maxAtmospheringSpeed = "",
      this.crew = "",
      this.passengers = "",
      this.cargoCapacity = "",
      this.consumables = "",
      this.vehicleClass = "",
      this.pilots = const [],
      this.films = const [],
      this.created = "",
      this.edited = "",
      this.url = ""});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'model': model,
      'manufacturer': manufacturer,
      'cost_in_credits': costInCredits,
      'length': length,
      'max_atmosphering_speed': maxAtmospheringSpeed,
      'crew': crew,
      'passengers': passengers,
      'cargo_capacity': cargoCapacity,
      'consumables': consumables,
      'vehicle_class': vehicleClass,
      'pilots': pilots,
      'films': films,
      'created': created,
      'edited': edited,
      'url': url,
    };
  }

  factory VehiclesModel.fromJson(Map<String, dynamic> json) {
    return VehiclesModel(
      name: json['name'],
      model: json['model'],
      manufacturer: json['manufacturer'],
      costInCredits: json['cost_in_credits'],
      length: json['length'],
      maxAtmospheringSpeed: json['max_atmosphering_speed'],
      crew: json['crew'],
      passengers: json['passengers'],
      cargoCapacity: json['cargo_capacity'],
      consumables: json['consumables'],
      vehicleClass: json['vehicle_class'],
      films: json['films'],
      created: json['created'],
      edited: json['edited'],
      url: json['url'],
    );
  }
}
