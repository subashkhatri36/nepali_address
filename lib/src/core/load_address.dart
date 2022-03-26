import 'dart:convert';

import 'package:flutter/services.dart';

///class to read json data
class AddressJsonData {
  static final AddressJsonData instance = AddressJsonData._();

  AddressJsonData._();

  factory AddressJsonData() {
    return instance;
  }

  ///reading your json data and store in model while loading app.

  Future<void> readJson() async {
    print("============read Json");
    final String response = await rootBundle.loadString('assets/address.json');
    print("response " + response);
    final data = await json.decode(response);
    print(data);
  }
}
