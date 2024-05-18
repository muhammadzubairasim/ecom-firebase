import 'package:ecom/features/authentication/authentication_repository.dart';
import 'package:ecom/features/authentication/screen/ForgetPassword.dart';
import 'package:ecom/features/authentication/screen/ResetVerification.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/popups/full_screen_loader.dart';
import 'package:ecom/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Processing Your Request', TImages.acerlogo);
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(
          title: 'e-mail Sent',
          message: 'E-mail link sent to Reset your Password'.tr);

      Get.to(() => ResetVerification(email: email.text.trim()));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Processing Your Request', TImages.acerlogo);
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(
          title: 'e-mail Sent',
          message: 'E-mail link sent to Reset your Password'.tr);
    } catch (e) {}
  }
}
