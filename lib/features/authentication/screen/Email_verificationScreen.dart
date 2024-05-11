import 'package:ecom/features/authentication/screen/VerificationSuccess.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/constants/text_strings.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Email_Verification_Screen extends StatelessWidget {
  const Email_Verification_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                      height: TDeviceUtils.getScreenHeight() * 0.4,
                      width: TDeviceUtils.getScreenWidth(context) * 0.6,
                      image: AssetImage(TImages.deliveredEmailIllustration))
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems),
                child: Text(
                  TTexts.confirmEmail,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Text(
                "zubairasim7@gmai.com",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems),
                child: Text(
                  TTexts.confirmEmailSubTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: TSizes.spaceBtwItems),
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(VerificationSuccess());
                        },
                        child: Text(TTexts.tContinue)),
                  )),
                ],
              ),
              TextButton(onPressed: () {}, child: Text(TTexts.resendEmail))
            ],
          ),
        ),
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
