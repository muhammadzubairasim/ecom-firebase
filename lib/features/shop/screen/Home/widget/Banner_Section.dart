import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';

class Banner_Section extends StatelessWidget {
  Banner_Section({
    super.key,
    required this.bannerImages,
  });
  final controller = Get.put(Banner_Controller());
  final List bannerImages;

  Widget customBoxFitImage(String ImagePath) {
    return Image(
      image: AssetImage(
        ImagePath,
      ),
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace * 1.4),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
            child: CarouselSlider(
              items: bannerImages.map((e) => customBoxFitImage(e)).toList(),
              options: CarouselOptions(
                  onPageChanged: (index, _) => controller.updateDot(index),
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  autoPlay: true,
                  reverse: true,
                  enableInfiniteScroll: true),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < bannerImages.length; i++)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Obx(
                    () => bannerBottomDots(
                      3,
                      30,
                      controller.currentIdx == i
                          ? TColors.primary
                          : TDeviceUtils.defaultColorIfDark(
                              context, Colors.white, Colors.black),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget bannerBottomDots(double h, double w, Color customColor) {
    return Container(
      height: h,
      width: w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: customColor,
      ),
    );
  }
}

class Banner_Controller extends GetxController {
  Rx<int> currentIdx = 0.obs;
  void updateDot(index) {
    currentIdx.value = index;
  }
}
