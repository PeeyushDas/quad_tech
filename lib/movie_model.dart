class Show {
  final int id;
  final String name;
  final String? imageUrl;
  final String? summary;
  final List<String> genres;
  final double? rating;
  final String? type;
  final String? status;
  final String? premiered;

  Show({
    required this.id,
    required this.name,
    this.imageUrl,
    this.summary,
    this.genres = const [],
    this.rating,
    this.type,
    this.status,
    this.premiered,
  });

  factory Show.fromJson(Map<String, dynamic> json) {
    // Check if the input is a 'show' wrapped json or direct show json
    final showData = json['show'] ?? json;

    return Show(
      id: showData['id'] ?? 0,
      name: showData['name'] ?? 'Unknown Title',
      imageUrl: showData['image']?['original'] ??
          showData['image']?['medium'] ??
          'https://via.placeholder.com/150',
      summary: showData['summary'] != null
          ? showData['summary'].toString().replaceAll(RegExp(r'<[^>]*>'), '')
          : 'No summary available',
      genres: showData['genres'] != null
          ? List<String>.from(showData['genres'])
          : [],
      rating: showData['rating']?['average']?.toDouble(),
      type: showData['type'],
      status: showData['status'],
      premiered: showData['premiered'],
    );
  }
}
