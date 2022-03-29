import 'dart:convert';

import 'package:nepali_address/nepali_address.dart';

class Address extends BaseModel {
  @override
  final String name;
  final List<Province> province;
  Address({
    required this.name,
    required this.province,
  }) : super('', '');

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'province ': province.map((x) => x.toMap()).toList(),
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      name: map['name'] ?? '',
      province: List<Province>.from(
          map['province ']?.map((x) => Province.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source));

  Address copyWith({
    String? name,
    List<Province>? province,
  }) {
    return Address(
      name: name ?? this.name,
      province: province ?? this.province,
    );
  }

  @override
  String toString() => 'Address(name: $name, province : $province )';
}
