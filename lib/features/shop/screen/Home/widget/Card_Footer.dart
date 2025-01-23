import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
class Card_Footer extends StatelessWidget {
  Card_Footer({
    super.key,
    required this.sPrice,
    this.ePrice = 0,
    this.counter = 0,
  });

  final double sPrice;
  final double? ePrice;
  int counter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace * 0.7  , vertical: 0.0),
      child: Container(
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${sPrice.toString()}${ePrice != 0 ? "-" : ""}${ePrice != 0 ? "\$" +ePrice.toString() : ""}",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: counter > 0
                      ? TColors.primary
                      : TDeviceUtils.defaultColorIfDark(
                      context, TColors.white, TColors.black),
                  borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(12),
                      bottomEnd: Radius.circular(12))),
              child: counter > 0
                  ? TextButton(
                  onPressed: () {},
                  child: Text(
                    counter.toString(),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ))
                  : IconButton(onPressed: () {}, icon: Icon(Icons.add) , color: TDeviceUtils.defaultColorIfDark(context, TColors.dark, TColors.white),),
            )
          ],
        ),
      ),
    );
  }
}
