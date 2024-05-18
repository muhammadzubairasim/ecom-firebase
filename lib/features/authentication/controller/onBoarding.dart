import 'package:ecom/features/authentication/screen/Signup_Sceen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../screen/Login_Screen.dart';

class onBoarding_controller extends GetxController {
  static onBoarding_controller get instance => Get.find();

  PageController pageController = PageController();
  RxInt currPageIndex = 0.obs;

  void updatePageIndicator(index) {
    currPageIndex.value = index;
  }

  void dotNavigationClick(index) {
    currPageIndex.value = index;
    pageController.jumpTo(index);
  }

  void nextPage() {
    if (currPageIndex.value == 2) {
      final storage = GetStorage();
      storage.write('isFirstTime', false);
      Get.offAll(() => Login_Screen());
    } else {
      currPageIndex.value = currPageIndex.value + 1;
      pageController.jumpToPage(currPageIndex.value);
    }
  }

  void skipPage() {
    currPageIndex.value = 2;
    pageController.jumpToPage(currPageIndex.value);
  }
}
