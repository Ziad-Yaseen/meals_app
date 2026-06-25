class Meal {
  final int? id;
  final String name;
  final String url;
  final int minimumTime;
  final int maximumTime;
  final String description;
  final double rate;

  Meal({
    this.id,
    required this.name,
    required this.url,
    required this.minimumTime,
    required this.maximumTime,
    required this.description,
    required this.rate,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'url': url,
    'description': description,
    'rate': rate,
    'minimumTime': minimumTime,
    'maximumTime': maximumTime,
  };

  factory Meal.fromMap(Map<String, dynamic> map) => Meal(
    id: map['id'],
    name: map['name'],
    url: map['url'],
    description: map['description'],
    rate: map['rate'],
    minimumTime: map['minimumTime'],
    maximumTime: map['maximumTime'],
  );
}