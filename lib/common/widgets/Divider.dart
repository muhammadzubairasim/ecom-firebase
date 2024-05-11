import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/text_strings.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class Divider_Widget extends StatelessWidget {
  const Divider_Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Divider(
              thickness: 1,
              endIndent: 5,
              indent: 60,
              color:
                  TDeviceUtils.isDark(context) ? TColors.grey : TColors.black),
        ),
        Text(
          TTexts.orSignInWith,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
              thickness: 1,
              endIndent: 60,
              indent: 5,
              color:
                  TDeviceUtils.isDark(context) ? TColors.grey : TColors.black),
        ),
      ],
    );
  }
}
