import 'package:flutter/material.dart';

class AddressTitle extends StatelessWidget {
  const AddressTitle({
    Key? key,
    this.isNepali = false,
  }) : super(key: key);
  final bool isNepali;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Text(
              isNepali ? 'ठेगाना' : 'Address',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Expanded(child: Divider())
          ],
        ),
      ),
    );
  }
}
