import 'dart:html';

import 'package:ecom/common/widgets/Appbar_ActionIcon.dart';
import 'package:ecom/common/widgets/HeaderAppbar.dart';
import 'package:ecom/features/shop/screen/Home/widget/Grid_Builder.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderAppbar(
        customTitle: Text("Wishlist" ,
          style: Theme.of(context).textTheme.headlineMedium,),
        customActions: [
          Appbar_ActionIcon(
            appbarActionIcon: Icons.add,
            userDefinedColor: TDeviceUtils.defaultColorIfDark(context, TColors.light, TColors.dark),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Grid_Builder(
                cardTitleMain: "Green Sports SHoes ",
                store: "Nike",
                imagePath: TImages.productImage1,
                endPrice: 100,
                startPrice: 50 ,
                wishListed: true,
            ),
          ],
        ),
      ),

    );
  }
}
