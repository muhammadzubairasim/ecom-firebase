import 'dart:async';

import 'package:ecom/features/authentication/screen/VerificationSuccess.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/text_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ecom/utils/popups/loaders.dart';
import 'package:ecom/features/authentication/screen/VerificationSuccess.dart';
import 'package:ecom/features/authentication/authentication_repository.dart';

class EmailVerificationController extends GetxController {
  static EmailVerificationController get instance => Get.find();

  @override
  void onInit() {
    SendEmailVerification();
    setTimerForAutoDirect();
    super.onInit();
  }

  //send email verification link
  SendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.SendEmailVerification();
      TLoaders.successSnackBar(
          title: 'Oh Snap',
          message: "Please Check Your Inbox and Verify Your E-mail");
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  setTimerForAutoDirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => VerificationSuccess(
              image: TImages.staticSuccessIllustration,
              title: TTexts.yourAccountCreatedTitle,
              subtitle: TTexts.yourAccountCreatedSubTitle,
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
            ));
      }
    });
  }

  checkEmailVerificationState() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => VerificationSuccess(
            image: TImages.staticSuccessIllustration,
            title: TTexts.yourAccountCreatedTitle,
            subtitle: TTexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ));
    }
  }
}
