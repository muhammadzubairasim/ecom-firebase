import 'package:ecom/features/authentication/controller/forgetPasswordController.dart';
import 'package:ecom/features/authentication/screen/Login_Screen.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/constants/text_strings.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetVerification extends StatelessWidget {
  const ResetVerification({super.key, required this.email});
  final String email;
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
                  TTexts.changeYourPasswordTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Text(
                email ?? " ",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems),
                child: Text(
                  TTexts.changeYourPasswordSubTitle,
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
                        onPressed: () => Get.offAll(() => const Login_Screen()),
                        child: Text(TTexts.tContinue)),
                  )),
                ],
              ),
              TextButton(
                  onPressed: () => ForgetPasswordController.instance
                      .resendPasswordResetEmail(email),
                  child: Text(TTexts.resendEmail))
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
