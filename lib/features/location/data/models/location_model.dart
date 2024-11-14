class LocationModel {
  final int? id;
  final String? name;
  final String? type;
  final String? dimension;
  final List? residents;
  final String? url;
  final String? created;

  LocationModel(
      {this.id,
      this.name,
      this.type,
      this.dimension,
      this.residents,
      this.url,
      this.created});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
        id: json['id'],
        name: json['name'],
        type: json['type'],
        dimension: json['dimension'],
        residents: json['residents'],
        url: json['url'],
        created: json['created']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "type": type,
      "dimension": dimension,
      "residents": residents,
      "url": url,
      "created": created
    };
  }
}
