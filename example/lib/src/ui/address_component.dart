import 'dart:async';

import 'package:example/src/core/load_address.dart';
import 'package:example/src/models/address.dart';
import 'package:flutter/material.dart';

class AddressContainer extends StatefulWidget {
  const AddressContainer({Key? key}) : super(key: key);

  @override
  State<AddressContainer> createState() => _AddressContainerState();
}

class _AddressContainerState extends State<AddressContainer> {
  var isComplete = Completer<bool>();
  late Address _address;

  @override
  void initState() {
    loadAddress();

    super.initState();
  }

  Future loadAddress() async {
    _address = await AddressJsonData.instance.readJson();
    isComplete.complete(true);
  }

  @override
  Widget build(BuildContext context) {
    if (isComplete.isCompleted) {
      return Text("COmplte");
    }
    return Scaffold(
      body: Center(child: Text('NOt  ompl')),
    );
  }
}
