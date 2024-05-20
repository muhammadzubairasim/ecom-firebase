import 'dart:html';

import 'package:ecom/common/widgets/HeaderAppbar.dart';
import 'package:ecom/features/Cart/Cart_Screen.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderAppbar(customTitle: Text("Order Review"), backArrow: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.separated(
                  itemBuilder: (_, index) =>Cart_Component_Header(counter: false),
                      shrinkWrap: true,
                  separatorBuilder: (_, __) => SizedBox(
                        height: TSizes.gridViewSpacing,
                      ),
                  itemCount: 2),
              Container(
                padding: EdgeInsets.symmetric(vertical: TSizes.defaultSpace/2 ,horizontal: TSizes.defaultSpace),
                decoration: BoxDecoration(
                  border: Border.all(width: 0.3 , color: TColors.darkGrey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Checkout_bill( title: "Subtotal", price: "500",),
                    Checkout_bill( title: "SHipping Fee", price: "0",),
                    Checkout_bill( title: "Tax Fee", price: "500",),
                    Divider(
                      color: TDeviceUtils.defaultColorIfDark(
                          context,
                          TColors.grey.withOpacity(0.2),
                          TColors.black.withOpacity(0.2)),
                      thickness: 2,
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Order Total" , style: Theme.of(context).textTheme.bodyMedium,),
                        Text("\$ " +"500" , style: Theme.of(context).textTheme.bodyMedium,),
                      ],
                    ),
                    ],
                ),
              ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Container(width: double.infinity, child: ElevatedButton(onPressed: (){}, child:Text("Cash on Delivery") )),
                    )
            ],
          ),
        ),
      ),
      // floatingActionButton: Container(width:TSizes.buttonWidth ,child: FloatingActionButton(onPressed:(){} ,child: ElevatedButton(onPressed: (){}, child: Text("Cash on delivery"), ),)),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

class Checkout_bill extends StatelessWidget {
   Checkout_bill({
    super.key,
     required this.title,
     required this.price,
  });

  String title;
  String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title , style: Theme.of(context).textTheme.labelMedium,),
          Text("\$ " +price , style: Theme.of(context).textTheme.bodyMedium,),
        ],
      ),
    );
  }
}
