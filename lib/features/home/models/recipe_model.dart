class RecipeModel {
  final String name;
  final double stars;
  final int minimumTime;
  final int maximumTime;
  final String image;

  RecipeModel({
    required this.name,
    required this.stars,
    required this.minimumTime,
    required this.maximumTime,
    required this.image,
  });
}
