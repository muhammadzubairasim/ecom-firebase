import 'package:ecom/common/widgets/HeaderAppbar.dart';
import 'package:ecom/features/shop/screen/Profile/Adresss/Add_Address_Tile.dart';
import 'package:ecom/features/shop/screen/Profile/Adresss/Address_Tile.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Address_Main extends StatelessWidget {
  const Address_Main({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderAppbar(
        backArrow: true,
        customTitle: Text("Address"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Address_Tile(),
            Address_Tile(
              selected: true,
            ),
            Address_Tile(),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(onPressed: (){ Get.to(const Add_Address_Tile()); } ,child: Icon(Icons.add , color: TColors.white, ), ),
    );
  }
}
