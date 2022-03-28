import 'package:flutter/material.dart';
import 'package:nepali_address/nepali_address.dart';

class AddressWidget<T extends BaseModel> extends StatelessWidget {
  const AddressWidget({
    Key? key,
    required this.list,
    required this.onChanged,
    this.value,
    required this.hint,
    this.borderColor = Colors.black,
    this.isRoundedBorder = false,
    this.padding,
    this.margin,
    this.radius = 10,
    this.isNepali = false,
  }) : super(key: key);

  final List<T> list;
  final Function(T?) onChanged;
  final T? value;
  final String hint;
  final Color borderColor;
  final bool isRoundedBorder;
  final double radius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool isNepali;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 10),
      margin: margin ?? const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: borderColor), borderRadius: isRoundedBorder ? BorderRadius.all(Radius.circular(radius)) : null),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          isExpanded: true,
          value: value,
          hint: Text(hint),
          items: list
              .map((e) => DropdownMenuItem<T>(
                    value: e,
                    child: Text(isNepali ? e.nepali : e.name),
                  ))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
