import 'package:ecom/features/shop/screen/Store/StoreScreen.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ViewMore_Divider extends StatelessWidget {
   ViewMore_Divider({
    super.key,
    required this.title, this.trailingButtom = true,
  });
  final String title;
  final bool trailingButtom ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          if(trailingButtom !=false) TextButton(onPressed: () { Get.to(()=>StoreScreen()); }, child: Text("View more")),
        ],
      ),
    );
  }
}
