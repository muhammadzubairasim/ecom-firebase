import 'package:ecom/common/Controller/Email_Verification_Controller.dart';
import 'package:ecom/features/authentication/authentication_repository.dart';
import 'package:ecom/features/authentication/screen/Login_Screen.dart';
import 'package:ecom/features/authentication/screen/VerificationSuccess.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/constants/text_strings.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Email_Verification_Screen extends StatelessWidget {
  const Email_Verification_Screen({super.key, required this.email});

  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EmailVerificationController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
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
                email ?? '',
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
                        onPressed: () =>
                            controller.checkEmailVerificationState(),
                        child: Text(TTexts.tContinue)),
                  )),
                ],
              ),
              TextButton(
                  onPressed: () => controller.SendEmailVerification(),
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
