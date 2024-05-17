import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class Wishlist_Button extends StatelessWidget {
  const Wishlist_Button({
    super.key,
    this.wishListed = false,
  });

  final bool wishListed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: TColors.white),
      child: IconButton(
        onPressed: () {},
        icon: Icon(wishListed ? Icons.favorite : Icons.favorite_outline ),
        color: wishListed ?  Colors.red : Colors.black ,
      ),
    );
  }
}