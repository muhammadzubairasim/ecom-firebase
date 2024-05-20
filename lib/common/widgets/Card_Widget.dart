import 'package:ecom/features/ProductDetail/Product_Detail.dart';
import 'package:ecom/features/shop/screen/Home/widget/Card_Footer.dart';
import 'package:ecom/features/shop/screen/Home/widget/Card_Second_Portion.dart';
import 'package:ecom/features/shop/screen/Home/widget/Image_Portion.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Card_Widget extends StatelessWidget {
   Card_Widget({super.key,
  required this.cardTitleMain,
    required this.store,
    required this.imagePath ,
    required this.endPrice,
    required this.startPrice,
    this.wishListed = false
  });
  double startPrice;
  double endPrice;
  String imagePath;
  String cardTitleMain;
  String store;
  bool wishListed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Get.to(Product_Detail()),
      child: Container(
        // // alignment: Alignment.centerLeft,
        // width: TDeviceUtils.getScreenWidth(context) * 0.45 > 500
        //     ? 250
        //     : TDeviceUtils.getScreenWidth(context) * 0.45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: TDeviceUtils.defaultColorIfDark(
                  context, TColors.grey, TColors.darkerGrey),
              spreadRadius: 0.1,
              blurRadius: 0.5,
              blurStyle: BlurStyle.outer,
            )
          ],
        ),
        child: Column(children: [
           Image_Portion(imagePath: imagePath, wishListed: wishListed, ),
            Card_Second_Portion(
            cardTitle: cardTitleMain,
            store: store,
          ),
          Card_Footer(
            sPrice: startPrice,
            ePrice: endPrice,
          )
        ]),
      ),
    );
  }
}




