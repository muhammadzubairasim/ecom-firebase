import 'package:ecom/common/widgets/HeaderAppbar.dart';
import 'package:ecom/common/widgets/ViewMore_Divider.dart';
import 'package:ecom/features/shop/screen/Home/HomeScreen.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ClippedPathHeader(
              clippedPathSection: Column(
            children: [
              HeaderAppbar(
                customTitle: Text(
                  "Accounts",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace -10),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(TImages.user),
                  ),
                  title: Text("Muhammad Zubair Asim" , style: Theme.of(context).textTheme.headlineSmall,),
                  subtitle: Text("zubairasim7@gmail.com"),
                  trailing: IconButton(onPressed: (){} , icon: Icon(Icons.edit_note), iconSize: TSizes.iconLg ,color: TColors.white )  ,
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          )),
          SizedBox(height: 10,),
          ViewMore_Divider(title: "Account Setting" , trailingButtom: false),
        ],
      ),
    );
  }
}
