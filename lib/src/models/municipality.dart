import 'dart:convert';

class Municipality {
  final int id;
  final String name;
  final String nepali;
  Municipality({
    required this.id,
    required this.name,
    required this.nepali,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'nepali': nepali,
    };
  }

  factory Municipality.fromMap(Map<String, dynamic> map) {
    return Municipality(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      nepali: map['nepali'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Municipality.fromJson(String source) =>
      Municipality.fromMap(json.decode(source));

  Municipality copyWith({
    int? id,
    String? name,
    String? nepali,
  }) {
    return Municipality(
      id: id ?? this.id,
      name: name ?? this.name,
      nepali: nepali ?? this.nepali,
    );
  }

  @override
  String toString() => 'Municipality(id: $id, name: $name, nepali: $nepali)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Municipality &&
        other.id == id &&
        other.name == name &&
        other.nepali == nepali;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ nepali.hashCode;
}
