import 'package:ecom/features/shop/screen/Home/HomeScreen.dart';
import 'package:ecom/features/shop/screen/Profile/ProfileScreen.dart';
import 'package:ecom/features/shop/screen/Store/StoreScreen.dart';
import 'package:ecom/features/shop/screen/Wishlist/WishlistScreen.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});
  final Controller = Get.put(BottomNavBarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          selectedIndex: Controller.selectedIndex.value,
          onDestinationSelected: (index) {
            Controller.selectedIndex.value = index;
          },
          backgroundColor:
              TDeviceUtils.isDark(context) ? TColors.black : TColors.white,
          indicatorColor: TDeviceUtils.isDark(context)
              ? TColors.black.withOpacity(0.5)
              : TColors.white.withOpacity(0.5),
          destinations: [
            NavigationDestination(
                icon: Icon(
                  Controller.selectedIndex.value == 0
                      ? Icons.home_filled
                      : Icons.home_outlined,
                ),
                label: 'Home'),
            NavigationDestination(
                icon: Icon(Controller.selectedIndex.value == 1
                    ? Icons.store
                    : Icons.store_outlined),
                label: 'Store'),
            NavigationDestination(
                icon: Icon(Controller.selectedIndex.value == 2
                    ? Icons.favorite
                    : Icons.favorite_border),
                label: 'Wishlist'),
            NavigationDestination(
                icon: Icon(Controller.selectedIndex.value == 3
                    ? Icons.person_2
                    : Icons.person_2_outlined),
                label: 'Profile'),
          ],
        ),
      ),
      body: Obx(
        () => Controller.screens[Controller.selectedIndex.value],
      ),
    );
  }
}

class BottomNavBarController extends GetxController {
  Rx<int> selectedIndex = 0.obs;
  final screens = [
    HomeScreen(),
    StoreScreen(),
    WishlistScreen(),
    ProfileScreen()
  ];
}
