import 'package:example/src/core/load_address_model.dart';
import 'package:example/src/models/address.dart';
import 'package:example/src/models/base_model.dart';
import 'package:example/src/models/district.dart';
import 'package:example/src/models/municipality.dart';
import 'package:example/src/models/place.dart';
import 'package:flutter/material.dart';

class AddressContainer extends StatefulWidget {
  const AddressContainer({Key? key}) : super(key: key);

  @override
  State<AddressContainer> createState() => _AddressContainerState();
}

class _AddressContainerState extends State<AddressContainer> {
  List<Place>? _placeList;
  List<District>? _districtList;
  List<Municipality>? _municipalityList;
  Address? _address;
  Place? _place;
  District? _district;
  Municipality? _municipality;

  @override
  void initState() {
    super.initState();
  }

  void selectCountry(Address address) {
    _address = address;
    _placeList = address.place;
    _place = null;
    _district = null;
    _districtList = null;
    _municipality = null;
    _municipalityList = null;
    setState(() {});
  }

  void selectPlace(Place place) {
    _place = place;
    _districtList = place.district;
    _district = null;
    _municipality = null;
    _municipalityList = null;
    setState(() {});
  }

  void selectDistrict(District district) {
    _district = district;
    _municipalityList = district.municipalities;
    _municipality = null;
    setState(() {});
  }

  selectMunicipality(Municipality municipality) {
    _municipality = municipality;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                width: double.infinity,
                child: Row(
                  children: const [
                    Text("Address"),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: Divider())
                  ],
                ),
              ),
              AddressWidget<Address>(
                hint: 'Country',
                list: addressListModel,
                value: _address,
                onChanged: (value) => selectCountry(value),
                val: 'country',
              ),
              // SizedBox(
              //   width: double.infinity,
              //   child: DropdownButton<Address>(
              //       focusColor: Colors.white,
              //       value: _address,
              //       //elevation: 5,
              //       style: const TextStyle(color: Colors.white),
              //       iconEnabledColor: Colors.black,
              //       items: addressListModel
              //           .map<DropdownMenuItem<Address>>((Address value) {
              //         return DropdownMenuItem<Address>(
              //           value: value,
              //           child: Text(
              //             value.country,
              //             style: const TextStyle(color: Colors.black),
              //           ),
              //         );
              //       }).toList(),
              //       hint: const Text(
              //         "Country",
              //         style: TextStyle(
              //             color: Colors.black,
              //             fontSize: 14,
              //             fontWeight: FontWeight.w500),
              //       ),
              //       onChanged: (value) => selectCountry(value!)),
              // ),

              if (_placeList != null)
                DropdownButton<Place>(
                  focusColor: Colors.white,
                  value: _place,
                  style: const TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.black,
                  items:
                      _placeList?.map<DropdownMenuItem<Place>>((Place value) {
                    return DropdownMenuItem<Place>(
                      value: value,
                      child: Text(
                        value.name,
                        style: const TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                  hint: const Text(
                    "Province",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  onChanged: (Place? value) => selectPlace(value!),
                ),
              if (_districtList != null)
                DropdownButton<District>(
                  focusColor: Colors.white,
                  value: _district,
                  style: const TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.black,
                  items: _districtList
                      ?.map<DropdownMenuItem<District>>((District value) {
                    return DropdownMenuItem<District>(
                      value: value,
                      child: Text(
                        value.name,
                        style: const TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                  hint: const Text(
                    "District",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  onChanged: (District? value) => selectDistrict(value!),
                ),
              if (_municipalityList != null)
                DropdownButton<Municipality>(
                  focusColor: Colors.white,
                  value: _municipality,
                  style: const TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.black,
                  items: _municipalityList?.map<DropdownMenuItem<Municipality>>(
                      (Municipality value) {
                    return DropdownMenuItem<Municipality>(
                      value: value,
                      child: Text(
                        value.name,
                        style: const TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                  hint: const Text(
                    "Municipality",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  onChanged: (Municipality? value) =>
                      selectMunicipality(value!),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddressWidget<T extends BaseModel> extends StatefulWidget {
  const AddressWidget({
    Key? key,
    this.value,
    this.list,
    required this.onChanged,
    required this.hint,
    required this.val,
  }) : super(key: key);

  final T? value;
  final List<T>? list;
  final Function(T) onChanged;
  final String hint;
  final String val;

  @override
  State<AddressWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState<T extends BaseModel> extends State<AddressWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DropdownButton<T>(
        focusColor: Colors.white,
        value: widget.value,
        //elevation: 5,
        style: const TextStyle(color: Colors.white),
        iconEnabledColor: Colors.black,
        items: widget.list?.map<DropdownMenuItem<T>>((T item) {
          return DropdownMenuItem<T>(
            value: item,
            child: Text(
              item.name,
              style: const TextStyle(color: Colors.black),
            ),
          );
        }).toList(),
        hint: Text(
          widget.hint,
          style: const TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
        ),
        onChanged: (T? value) => widget.onChanged(value!),
      ),
    );
  }
}
