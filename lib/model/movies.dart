class MovieModel {
  final Show? show;

  MovieModel({this.show});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      show: json['show'] != null ? Show.fromJson(json['show']) : null,
    );
  }
}

class Show {
  final int id;
  final String name;
  final String image;
  final String summary;

  Show(
      {required this.id,
      required this.name,
      required this.image,
      required this.summary});

  factory Show.fromJson(Map<String, dynamic> json) {
    return Show(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown',
      image: json['image'] != null
          ? json['image']['original']
          : 'https://png.pngtree.com/png-vector/20190820/ourmid/pngtree-no-image-vector-illustration-isolated-png-image_1694547.jpg', // Image URL
      summary: json['summary'] ?? 'No summary available',
    );
  }
}
