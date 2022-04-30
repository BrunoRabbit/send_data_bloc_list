class Car {
  int id;
  String name;

  Car({
    required this.id,
    required this.name,
  });

  Car copyWith({
    int? id,
    String? name,
  }) {
    return Car(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
