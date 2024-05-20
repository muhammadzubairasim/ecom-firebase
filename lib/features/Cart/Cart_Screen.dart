import 'package:ecom/common/widgets/HeaderAppbar.dart';
import 'package:ecom/features/Checkout/Checkout.dart';
import 'package:ecom/features/ProductDetail/widgets/Product_Detail_Bottom.dart';
import 'package:ecom/features/shop/screen/Home/widget/Card_Second_Portion.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart_Screen extends StatelessWidget {
  const Cart_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderAppbar(
        customTitle: Text("Cart"),
        backArrow: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (_, __) => SizedBox(
                height: 30,
              ),
              itemCount: 4,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.defaultSpace),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Cart_Component_Header(),
                          Text(
                            "\$123",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Container(
                width: TSizes.buttonWidth,
                  child:
                      ElevatedButton(onPressed: () { Get.to(()=> Checkout()); }, child: Text("Checkout"))),
            ),
          ],
        ),
      ),
    );
  }
}

class Cart_Component_Header extends StatelessWidget {
   Cart_Component_Header({
    super.key,
    this.counter = true
  });
  bool counter;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 70,
          width: 70,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: TDeviceUtils.defaultColorIfDark(
                  context,
                  TColors.darkGrey.withOpacity(0.1),
                  TColors.grey.withOpacity(0.1))),
          child: Image(
            image: AssetImage(TImages.productImage1),
          ),
        ),
        SizedBox(
          width: TSizes.defaultSpace,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Brand_Verified(store: "Nike"),
            Text(
              "Description if product ",
              style:
                  Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(
              height: 20,
            ),
            if(counter) Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Custom_Counter(),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
