import 'dart:convert';

import 'package:example/src/models/address.dart';
import 'package:flutter/services.dart';

///class to read json data
class AddressJsonData {
  static final AddressJsonData instance = AddressJsonData._();

  AddressJsonData._();

  factory AddressJsonData() {
    return instance;
  }

  ///reading your json data and store in model while loading app.

  Future<Address> readJson() async {
    final String response = await rootBundle.loadString('assets/address.json');

    final data = await json.decode(response);
    Address address = Address.fromJson(data);
    return address;
  }
}
