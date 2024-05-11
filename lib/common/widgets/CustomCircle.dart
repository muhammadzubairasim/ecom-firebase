import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class Custom_Circle extends StatelessWidget {
  Custom_Circle({
    super.key,
    this.size = 300,
    this.positionX = 0,
    this.positionY = 0,
    this.opacity = 0.5,
  });
  final double size;
  final double positionY;
  final double positionX;
  final double opacity;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getScreenHeight() * positionY, //-0.1
      right: TDeviceUtils.getScreenWidth(context) * positionX, //,-29
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size),
            color: TColors.white.withOpacity(opacity)),
        // color: Colors.red,
      ),
    );
  }
}
