import 'package:ecom/common/widgets/BottomNavBar.dart';
import 'package:ecom/common/widgets/Card_Widget.dart';
import 'package:ecom/features/authentication/controller/onBoarding.dart';
import 'package:ecom/features/authentication/screen/Email_verificationScreen.dart';
import 'package:ecom/features/authentication/screen/ForgetPassword.dart';
import 'package:ecom/features/authentication/screen/Login_Screen.dart';
import 'package:ecom/features/authentication/screen/ResetVerification.dart';
import 'package:ecom/features/authentication/screen/Signup_Sceen.dart';
import 'package:ecom/features/authentication/screen/VerificationSuccess.dart';
import 'package:ecom/features/authentication/screen/onBoarding_screen.dart';
import 'package:ecom/features/shop/screen/Home/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ecom/utils/constants/text_strings.dart';
import 'package:ecom/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      // initialBinding: GeneralBindings(),
      home: BottomNavBar(), // bottom nav bar is the entry point for app
    );
  }
}
