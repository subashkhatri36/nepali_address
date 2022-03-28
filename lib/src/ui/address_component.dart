import 'package:flutter/material.dart';
import 'package:nepali_address/nepali_address.dart';

class AddressContainer extends StatefulWidget {
  const AddressContainer({
    Key? key,
    required this.selectMunicipality,
    required this.selectDistrict,
    required this.selectProvince,
    required this.wardController,
    this.borderColor = Colors.black,
    this.isRoundedBorder = false,
    this.padding,
    this.margin,
    this.radius = 10,
    this.isNepali = false,
  }) : super(key: key);
  final TextEditingController wardController;
  final Function(String) selectProvince;
  final Function(String) selectDistrict;
  final Function(String) selectMunicipality;
  final Color borderColor;
  final bool isRoundedBorder;
  final double radius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool isNepali;

  @override
  State<AddressContainer> createState() => _AddressContainerState();
}

class _AddressContainerState extends State<AddressContainer> {
  List<District>? _districtList;
  List<Municipality>? _municipalityList;
  Place? _place;
  District? _district;
  Municipality? _municipality;

  @override
  void initState() {
    super.initState();
  }

  void selectPlace(Place? place) {
    if (place == null) {
      return;
    }
    _place = place;
    _districtList = place.district;
    _district = null;
    _municipality = null;
    _municipalityList = null;
    widget.wardController.clear();
    if (_place != null) {
      widget.selectProvince(widget.isNepali ? _place!.nepali : _place!.name);
    }
    setState(() {});
  }

  selectDistrict(District? district) {
    if (district == null) {
      return;
    }
    _district = district;
    _municipalityList = district.municipalities;
    _municipality = null;
    widget.selectDistrict(widget.isNepali ? _district!.nepali : _district!.name);
    setState(() {});
  }

  selectMunicipality(Municipality? municipality) {
    if (municipality == null) {
      return;
    }
    _municipality = municipality;
    widget.selectMunicipality(widget.isNepali ? _municipality!.nepali : _municipality!.name);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _body;
  }

  Widget get _body => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddressTitle(
              isNepali: widget.isNepali,
            ),
            AddressWidget<Place>(
              isNepali: widget.isNepali,
              list: addressList.place,
              value: _place,
              hint: widget.isNepali ? 'प्रदेश' : 'Province',
              onChanged: selectPlace,
              isRoundedBorder: widget.isRoundedBorder,
              padding: widget.padding,
              margin: widget.margin,
              borderColor: widget.borderColor,
            ),
            if (_districtList != null)
              AddressWidget<District>(
                isNepali: widget.isNepali,
                list: _districtList!,
                value: _district,
                hint: widget.isNepali ? 'जिल्ला' : 'District',
                onChanged: selectDistrict,
                isRoundedBorder: widget.isRoundedBorder,
                padding: widget.padding,
                margin: widget.margin,
                borderColor: widget.borderColor,
              ),
            if (_municipalityList != null)
              AddressWidget<Municipality>(
                isNepali: widget.isNepali,
                list: _municipalityList!,
                value: _municipality,
                hint: widget.isNepali ? 'नगरपालिका/गाउँपालिका' : 'Municipality',
                onChanged: selectMunicipality,
                isRoundedBorder: widget.isRoundedBorder,
                padding: widget.padding,
                margin: widget.margin,
                borderColor: widget.borderColor,
              ),
            if (_municipality != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
                child: TextFormField(
                  controller: widget.wardController,
                  keyboardType: TextInputType.number,
                  maxLength: 2,
                  decoration: InputDecoration(
                      labelText: widget.isNepali ? 'वार्ड नं' : 'Ward No',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: widget.borderColor),
                        borderRadius: widget.isRoundedBorder ? BorderRadius.circular(widget.radius) : BorderRadius.zero,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: widget.borderColor),
                        borderRadius: widget.isRoundedBorder ? BorderRadius.circular(widget.radius) : BorderRadius.zero,
                      )),
                ),
              ),
          ],
        ),
      );
}
