import 'dart:convert';

import 'package:example/src/models/municipality.dart';
import 'package:flutter/foundation.dart';

class District {
  final String name;
  final String nepali;
  final int id;
  final List<Municipality> municipalities;
  District({
    required this.name,
    required this.nepali,
    required this.id,
    required this.municipalities,
  });

  District copyWith({
    String? name,
    String? nepali,
    int? id,
    List<Municipality>? municipalities,
  }) {
    return District(
      name: name ?? this.name,
      nepali: nepali ?? this.nepali,
      id: id ?? this.id,
      municipalities: municipalities ?? this.municipalities,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'nepali': nepali,
      'id': id,
      'municipalities': municipalities.map((x) => x.toMap()).toList(),
    };
  }

  factory District.fromMap(Map<String, dynamic> map) {
    return District(
      name: map['name'] ?? '',
      nepali: map['nepali'] ?? '',
      id: map['id']?.toInt() ?? 0,
      municipalities: List<Municipality>.from(map['municipalities']?.map((x) => Municipality.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory District.fromJson(String source) => District.fromMap(json.decode(source));

  @override
  String toString() {
    return 'District(name: $name, nepali: $nepali, id: $id, municipalities: $municipalities)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is District &&
        other.name == name &&
        other.nepali == nepali &&
        other.id == id &&
        listEquals(other.municipalities, municipalities);
  }

  @override
  int get hashCode {
    return name.hashCode ^ nepali.hashCode ^ id.hashCode ^ municipalities.hashCode;
  }
}
