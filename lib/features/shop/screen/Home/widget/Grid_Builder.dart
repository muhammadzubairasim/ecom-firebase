import 'package:ecom/common/widgets/Card_Widget.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:flutter/material.dart';


class Grid_Builder extends StatelessWidget {
  Grid_Builder({
    super.key,
    this.totalItemCount = 4,
    this.itemInOneLine =2,
    required this.cardTitleMain,
    required this.store,
    required this.imagePath ,
    required this.endPrice,
    required this.startPrice,
    this.wishListed = false
  });
  final int totalItemCount ;
  final int itemInOneLine ;
  double startPrice;
  double endPrice;
  String imagePath;
  String cardTitleMain;
  String store;
  bool wishListed ;



  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:  TDeviceUtils.getScreenWidth(context) < 350? 1 : itemInOneLine,
          mainAxisExtent: 350,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5
      ),
      itemBuilder: (_, index) {
        return Card_Widget(cardTitleMain: cardTitleMain , store: store, endPrice: endPrice, startPrice: startPrice, imagePath: imagePath, wishListed:wishListed, );
      },


    );
  }
}