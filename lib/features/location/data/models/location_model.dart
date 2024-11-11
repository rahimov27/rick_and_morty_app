class LocationModel {
  final int? id;
  final String? name;
  final String? type;
  final String? dimension;
  final List<String> residents;
  final String? url;
  final String? created;

  LocationModel({
    required this.id,
    this.name,
    this.created,
    this.type,
    this.url,
    this.dimension,
    required this.residents,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json['id'],
      url: json['url'],
      created: json['created'],
      residents: List<String>.from(json['residents'] ?? []), // Преобразование в List<String>
      name: json["name"],
      type: json['type'],
      dimension: json['dimension'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'residents': residents,
      'name': name,
      'type': type,
      'dimension': dimension,
      'url': url,
      'created': created,
    };
  }
}
