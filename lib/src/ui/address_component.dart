import 'package:flutter/material.dart';
import 'package:nepali_address/nepali_address.dart';

class AddressContainer extends StatefulWidget {
  const AddressContainer({Key? key}) : super(key: key);

  @override
  State<AddressContainer> createState() => _AddressContainerState();
}

class _AddressContainerState extends State<AddressContainer> {
  @override
  void initState() {
    print("============initstate");
    AddressJsonData.instance.readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Hello')),
    );
  }
}
