import 'package:ecom/features/authentication/controller/login_controller.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Icons_Footer extends StatelessWidget {
  const Icons_Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 1,
                  blurStyle: BlurStyle.inner,
                  color: TColors.grey,
                ),
              ],
              border: Border.all(
                  width: 0.5,
                  color: TDeviceUtils.isDark(context)
                      ? TColors.grey
                      : TColors.black),
              borderRadius: BorderRadius.circular(100),
            ),
            child: IconButton(
              onPressed: () => controller.googleSignIn(),
              icon: const Image(
                width: TSizes.iconMd,
                height: TSizes.iconMd,
                image: AssetImage(TImages.google),
              ),
            ),
          ),
          SizedBox(
            width: TSizes.spaceBtwItems,
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 1,
                  blurStyle: BlurStyle.inner,
                  color: TColors.grey,
                ),
              ],
              border: Border.all(
                  width: 0.5,
                  color: TDeviceUtils.isDark(context)
                      ? TColors.grey
                      : TColors.black),
              borderRadius: BorderRadius.circular(100),
            ),
          )
        ],
      ),
    );
  }
}
