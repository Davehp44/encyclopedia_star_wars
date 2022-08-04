class RequestModel {
  final int countElement;
  final String? next;
  final String? previous;
  final List<dynamic> results;

  RequestModel(
      {this.countElement = 0,
      this.next = "",
      this.previous = "",
      this.results = const []});

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      countElement: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: json['results'],
    );
  }
}
