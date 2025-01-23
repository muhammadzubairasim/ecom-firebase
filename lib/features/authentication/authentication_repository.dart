import 'dart:html';

import 'package:ecom/features/authentication/user/user_model.dart';
import 'package:ecom/utils/local_storage/storage_utility.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ecom/common/widgets/BottomNavBar.dart';
import 'package:ecom/features/authentication/screen/Email_verificationScreen.dart';
import 'package:ecom/features/authentication/screen/VerificationSuccess.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecom/features/authentication/screen/onBoarding_screen.dart';
import 'package:ecom/features/authentication/screen/Login_screen.dart';
import 'package:ecom/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:ecom/utils/exceptions/platform_exceptions.dart';
import 'package:ecom/utils/exceptions/format_exceptions.dart';
import 'package:ecom/utils/exceptions/firebase_exceptions.dart';
import 'package:ecom/features/authentication/controller/login_controller.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ecom/common/Controller/Email_Verification_Controller.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  User? get userState => _auth.currentUser;
  /// Called from main.dart on app launch
  @override
  void onReady() {
    // Remove the native splash screen
    // FlutterNativeSplash.remove();

    // Redirect to the appropriate screen
    screenRedirect();
  }

  /// Function to Show Relevant Screen
  void screenRedirect() async {
    final user = _auth.currentUser;
    print(_auth.currentUser);
    if (user != null) {
      if (user.emailVerified) {

        TLocalStorage.init(user.uid);
        Get.offAll(() => BottomNavBar());
      } else {
        Get.offAll(
            () => Email_Verification_Screen(email: _auth.currentUser?.email));
      }
    }





    // Local Storage
    // if (kDebugMode) {
    //   print('=====================GET STORAGE Auth Repo ===================');
    //   print(deviceStorage.read('isFirstTime'));
    // }
    // deviceStorage.writeIfNull('IsFirstTime', true);

    // Check if it's the first time launching the app
    // if (deviceStorage.read('IsFirstTime') != true) {
    //   Get.offAll(() =>
    //       const Login_Screen()); // Redirect to Login Screen if not the first time
    // }
    else {
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => Login_Screen())
          : Get.offAll(() => onBoarding_Screen());
    }

    // final isFirstTime = deviceStorage.read('IsFirstTime');
    // if (isFirstTime != null && isFirstTime != true) {
    //   Get.offAll(() => const Login_Screen());
    // } else {
    //   Get.offAll(() => onBoarding_Screen());
    // }

    // deviceStorage.writeIfNull('isFirstTime', true);
    // deviceStorage.read('isFirstTime') != true
    //     ? Get.offAll(() => const Login_Screen())
    //     : Get.offAll(onBoarding_Screen());
  }

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      // Handle other exceptions here if needed
      Text('An unexpected error occurred: $e');
      rethrow;
    }
  }

  Future<void> SendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      // Handle other exceptions here if needed
      Text('An unexpected error occurred: $e');
      rethrow;
    }
  }

  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      // Handle other exceptions here if needed
      Text('An unexpected error occurred: $e');
      rethrow;
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      // Handle other exceptions here if needed
      Text('An unexpected error occurred: $e');
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const Login_Screen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      // Handle other exceptions here if needed
      Text('An unexpected error occurred: $e');
      rethrow;
    }
  }

  // Future<UserCredential> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
  //     final GoogleSignInAuthentication? googleAuth =
  //         await userAccount?.authentication;
  //     //create new credentials
  //     final credentials = GoogleAuthProvider.credential(
  //         accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
  //     return await _auth.signInWithCredential(credentials);
  //   } on FirebaseAuthException catch (e) {
  //     throw TFirebaseAuthException(e.code).message;
  //   } on FirebaseException catch (e) {
  //     throw TFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const TFormatException();
  //   } on PlatformException catch (e) {
  //     throw TPlatformException(e.code).message;
  //   } catch (e) {
  //     // Handle other exceptions here if needed
  //     Text('A n unexpected error occurred: $e');
  //     rethrow;
  //   }
  // }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignIn googleSignIn = GoogleSignIn(
      // clientId: 'YOUR_CLIENT_ID', // Remove this line if it exists
      clientId: '917163754175-j03s5av83kes0jlv01monf5itscn1hfl.apps.googleusercontent.com', // Replace with your Firebase App ID
    );

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(

      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
