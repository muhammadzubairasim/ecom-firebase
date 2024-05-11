import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
class Appbar_SearchBar extends StatelessWidget {
  const Appbar_SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace),
      child: SizedBox(
        height: 60,
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.start,
          style: const TextStyle(color: Colors.black),
          decoration:  InputDecoration(
            fillColor: TDeviceUtils.defaultColorIfDark(context, TColors.dark, TColors.light),
            filled: true,
            hintText: "Search in store",
            hintStyle: TextStyle(color: TColors.darkGrey),
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
