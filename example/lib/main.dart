import 'package:flutter/material.dart';
import 'package:nepali_address/nepali_address.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nepali Address',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController wardController = TextEditingController();
  List<String> fullAddress = [];
  bool isAddressSelected = false;

  Address address = addressList;

  void checkAddress() {
    if (fullAddress.length > 1 && wardController.text.isNotEmpty) {
      isAddressSelected = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AddressContainer(
              isRoundedBorder: true,
              selectDistrict: (String district) {
                fullAddress.add('District ' + district);
              },
              selectProvince: (String province) {
                fullAddress.clear();
                fullAddress.add('\n Province ' + province);
              },
              selectMunicipality: (String municipality) {
                fullAddress.add('\n Municipality ' + municipality);
              },
              wardController: wardController,
              isNepali: false,
            ),
            ElevatedButton(
                onPressed: () => checkAddress(),
                child: const Text('Show Address')),
            if (isAddressSelected)
              for (int i = 0; i < fullAddress.length; i++) ...[
                Text(fullAddress[i] + '\n')
              ]
            else
              const Text('No Address Selected'),
            Text('Ward :' + wardController.text),
          ],
        ),
      ),
    );
  }
}
