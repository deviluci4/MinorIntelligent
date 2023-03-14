class Location {
  final String name;
  final String description;
  final List<String> images;

  Location({required this.name, required this.description, required this.images});

  factory Location.fromJson(Map<String, dynamic> json) {
    var imagesJson = json['images'] as List<dynamic>;
    List<String> images = imagesJson.map((image) => image.toString()).toList();

    return Location(
      name: json['name'],
      description: json['description'],
      images: images,
    );
  }
}