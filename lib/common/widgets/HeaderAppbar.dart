import 'package:ecom/app.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderAppbar extends StatelessWidget  implements PreferredSize{
  const HeaderAppbar(
      {super.key,
      this.leadingIcon,
      this.customTitle,
      this.backArrow = false,
      this.customActions,
      this.leadingCallback});
  final Widget? customTitle;
  final bool? backArrow;
  final List<Widget>? customActions;
  final IconData? leadingIcon;
  final VoidCallback? leadingCallback;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: TSizes.defaultSpace, right: TSizes.defaultSpace , top: TSizes.defaultSpace),
      child: AppBar(
        automaticallyImplyLeading: backArrow!=false?true: false,
        leading: backArrow != false
            ? IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back,color:  TDeviceUtils.defaultColorIfDark(context, TColors.white, TColors.dark) ,),
                highlightColor: Colors.white,
              )
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingCallback,
                    icon: Icon(
                      leadingIcon,
                    ))
                : null,
        actions: customActions,
        title: customTitle,
      ),
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight( TDeviceUtils.getScreenHeight() * 0.12);
}
