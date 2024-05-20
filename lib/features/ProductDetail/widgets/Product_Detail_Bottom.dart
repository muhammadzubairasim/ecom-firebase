import 'package:ecom/features/Cart/Cart_Screen.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Product_Detail_Bottom extends StatelessWidget {
  const Product_Detail_Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(TSizes.defaultSpace/3)  ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Custom_Counter(),
          ElevatedButton(onPressed: (){ Get.to(()=>Cart_Screen()); }, child: Padding(
            padding: const EdgeInsets.symmetric(vertical: TSizes.borderRadiusMd/2 , horizontal: TSizes.borderRadiusLg*1.5 ),
            child: Row(
              children: [
                Icon(Icons.shopping_cart),
                Text("Add to Cart"),
              ],
            ),
          ) , )
        ],
      ),
    );
  }
}

class Custom_Counter extends StatelessWidget {
  const Custom_Counter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: TColors.grey.withOpacity(0.3),
              ),
            child: IconButton(onPressed: (){}, icon: Icon(Icons.remove) , color:  TDeviceUtils.defaultColorIfDark(context, TColors.white, TColors.black) , )),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text("1"),
        ),

        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: TColors.primary,
            ),
            child: IconButton(onPressed: (){}, icon: Icon(Icons.add) ,  color: TColors.white, ))
      ],
    );
  }
}
