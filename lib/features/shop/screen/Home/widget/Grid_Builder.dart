import 'package:ecom/common/widgets/Card_Widget.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class Grid_Builder extends StatelessWidget {
  Grid_Builder({
    super.key,
    this.totalItemCount = 6,
    this.itemInOneLine = 2,
    required this.cardTitleMain,
    required this.store,
    required this.imagePath, // Changed to list of image paths
    required this.endPrice,
    required this.startPrice,
    this.wishListed = false,
  });

  final int totalItemCount;
  final int itemInOneLine;
  final double startPrice;
  final double endPrice;
  final List<String> imagePath; // Changed to list of image paths
  final List<String> cardTitleMain;
  final String store;
  final bool wishListed;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: totalItemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            TDeviceUtils.getScreenWidth(context) < 350 ? 1 : itemInOneLine,
        mainAxisExtent: 350,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      itemBuilder: (_, index) {
        return Card_Widget(
          cardTitleMain: cardTitleMain[index % cardTitleMain.length],
          store: store,
          endPrice: endPrice,
          startPrice: startPrice,
          imagePath: imagePath[
              index % imagePath.length], // Use index to get the image path
          wishListed: wishListed,
        );
      },
    );
  }
}
