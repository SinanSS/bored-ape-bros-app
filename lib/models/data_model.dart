class DataModel {
  String? name;
  String? description;
  String? imageUrl;

  DataModel({
    this.name,
    this.description,
    this.imageUrl,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        name: json['name'],
        description: json['description'],
        imageUrl: json['image_url'],
      );
}
