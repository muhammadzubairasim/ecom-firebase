import 'package:ecom/common/widgets/HeaderAppbar.dart';
import 'package:ecom/common/widgets/ViewMore_Divider.dart';
import 'package:ecom/features/personalization/screen/Profile/Profile_Info.dart';
import 'package:ecom/features/shop/screen/Home/HomeScreen.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

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
                  trailing: IconButton(onPressed: (){  Get.to(()=> Profile_Info()); } , icon: Icon(Icons.edit_note), iconSize: TSizes.iconLg ,color: TColors.white )  ,
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          )),
          ViewMore_Divider(title: "Account Setting" , trailingButtom: false),
          Account_ListTile(title: "My Account " , subtitle: "Set shopping Delivery address", leadingIcon: Icons.edit_calendar),
          Account_ListTile(title: "My Cart " , subtitle: "Add or remove products to cart", leadingIcon: Icons.shopping_cart,),
          Account_ListTile(title: "My Orders " , subtitle: "In-process and complete orders", leadingIcon: Icons.delivery_dining,),
          Account_ListTile(title: "Bank Account " , subtitle: "WithDraw balance to register bank account", leadingIcon: Icons.comment_bank,),
          Account_ListTile(title: "My Coupon " , subtitle: "List of all discounted coupon", leadingIcon: Icons.account_balance_wallet,),
          Account_ListTile(title: "Notification" , subtitle: "Send any kind of discounted message ", leadingIcon: Icons.notification_add,),
          Account_ListTile(title: "Account privacy" , subtitle: "Manage account settings", leadingIcon: Icons.safety_check,),
          ViewMore_Divider(title: "App Settings" , trailingButtom: false),
          Account_ListTile(title: "Notification" , subtitle: "Send any kind of discounted message ",leadingIcon: Icons.construction, ),
          Account_ListTile(title: "Account privacy" , subtitle: "Manage account settings", leadingIcon: Icons.construction,),
        ],
      ),
    );
  }
}

class Account_ListTile extends StatelessWidget {
  const Account_ListTile({
    super.key, required this.title, required this.subtitle,
    this.trailingSwitch = false,
    required this.leadingIcon,
  });
  final String title;
  final String subtitle;
  final bool trailingSwitch;
  final IconData leadingIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      leading: Icon(leadingIcon , color: TColors.primary.withOpacity(0.8),),
      title: Text(title),
      subtitle: Text(subtitle   , style: Theme.of(context).textTheme.labelSmall!.apply(color: Colors.grey),),
      trailing: trailingSwitch ? Switch(value: true, onChanged:(val){}) : null,
    );
  }
}
