import 'package:ecom/common/widgets/BottomNavBar.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/constants/text_strings.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationSuccess extends StatelessWidget {
  const VerificationSuccess({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  final String image;
  final String title;
  final String subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image(
            image: AssetImage(TImages.staticSuccessIllustration),
            height: TDeviceUtils.getScreenHeight() * 0.3,
            width: TDeviceUtils.getScreenWidth(context) * 0.7,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems),
            child: Text(
              TTexts.yourAccountCreatedTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Text(
            TTexts.yourAccountCreatedSubTitle,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: TSizes.spaceBtwItems * 2),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(BottomNavBar());
                    },
                    child: Text(TTexts.tContinue),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          Get.back();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
    );
  }
}
