import 'package:ecom/features/authentication/authentication_repository.dart';
import 'package:ecom/features/authentication/screen/Email_verificationScreen.dart';
import 'package:ecom/features/authentication/user/user_repository.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/popups/full_screen_loader.dart';
import 'package:ecom/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:ecom/utils/helpers/network_manager.dart';
import 'package:ecom/features/authentication/screen/Signup_Sceen.dart';
import 'package:ecom/features/authentication/user/user_model.dart';
import 'package:ecom/features/authentication/user/user_repository.dart';
// import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:ecom/features/authentication/screen/Email_verificationScreen.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //variables
  final hidePassword = true.obs;
  Rx<bool> privacyPolicy = false.obs;
  final email = TextEditingController();
  final lastname = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstname = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void privacyChecked() {
    privacyPolicy.value = !privacyPolicy.value ?? true;
  }

  //signup
  Future<void> signup() async {
    try {
      //start loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information', TImages.docker);
      //CHECK INTERNET CONNECTIVITY
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TLoaders.errorSnackBar(
          title: "No  Internet Connection",
          // message:
          //     'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use',
        );
        return;
      }
      ;

      //formvalidation
      if (!signupFormKey.currentState!.validate()) {
        TLoaders.errorSnackBar(
          title: "fields are required",
          // message:
          //     'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use',
        );
        return;
      }
      ;
      //   //     privacy policy check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: "Accept Privacy Policy",
          message:
              'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use',
        );
        return;
      }

//   //     register user in the firebase and save user data in firebase
      final UserCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());
      //save authenticated user data in firebase firestore
      final newUser = UserModel(
          id: UserCredential.user!.uid,
          firstName: firstname.text.trim(),
          lastName: lastname.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
      );
      final userRepository = Get.put(UserRepository());
      userRepository.saveUserRecord(newUser);

      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Verify email to continue.');
      //MOVE TO VERIFY EMAIL SCREEN
      Get.to(() => Email_Verification_Screen(
            email: email.text.trim(),
          ));
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      TFullScreenLoader.stopLoading();
    }
  }
}




//   //   } catch (e) {
//   //     TLoaders.errorSnackBar(title: 'oh snap', message: e.toString());
//   //   } finally {
//   //     TFullScreenLoader.stopLoading();
//   //   }
//   // }
// }
