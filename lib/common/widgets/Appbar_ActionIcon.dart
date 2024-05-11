import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class Appbar_ActionIcon extends StatelessWidget {
  const Appbar_ActionIcon({super.key,
    this.count = null  ,
    this.userDefinedColor = TColors.white,
    this.appbarActionIcon
  });

  final int? count;
  final Color userDefinedColor;
  final IconData? appbarActionIcon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          color: userDefinedColor,
          onPressed: () {},
          icon: Icon(appbarActionIcon,size: TSizes.iconLg,),
        ),
         if(count!=null) cartCount(context)
      ],
    );
  }

  Positioned cartCount(BuildContext context) {
    return Positioned(
      top: 0.0,
      right: 0.0,
      child: Container(
        alignment: Alignment.center,
        height: 15,
        width: 15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: TColors.black,
        ),
        child: Text(
           count.toString() ,
          style: Theme
              .of(context)
              .textTheme
              .labelSmall!.apply(color: TColors.white),
        ),
      ),
    );
  }
}