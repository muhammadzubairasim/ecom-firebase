import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Wishlist_Button extends StatelessWidget {
   Wishlist_Button({
    super.key,
    this.wishListed = false,
  });

   bool wishListed;

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: TColors.white),
      child: IconButton(
        onPressed: () {
        },
        icon: Icon(wishListed ? Icons.favorite : Icons.favorite_outline ),
        color: wishListed ?  Colors.red : Colors.black ,
      ),
    );
  }
}