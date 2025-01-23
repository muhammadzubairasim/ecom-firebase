import 'package:ecom/features/authentication/controller/onBoarding.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/constants/text_strings.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:ecom/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoarding_Screen extends StatelessWidget {
  onBoarding_Screen({super.key});
  final controller = Get.put(onBoarding_controller());
  @override
  Widget build(BuildContext context) {
    final isDark = TDeviceUtils.isDark(context);
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingWidget(
                  path: TImages.onBoardingImage1,
                  title: TTexts.onBoardingTitle1,
                  subTitle: TTexts.onBoardingSubTitle1),
              OnBoardingWidget(
                  path: TImages.onBoardingImage2,
                  title: TTexts.onBoardingTitle2,
                  subTitle: TTexts.onBoardingSubTitle2),
              OnBoardingWidget(
                  path: TImages.onBoardingImage3,
                  title: TTexts.onBoardingTitle3,
                  subTitle: TTexts.onBoardingSubTitle3),
            ],
          ),
          Positioned(
              top: TDeviceUtils.getAppBarHeight() - 20,
              right: TSizes.defaultSpace,
              child: TextButton(
                  onPressed: () {
                    controller.skipPage();
                  },
                  child: Obx(() => controller.currPageIndex.value < 2
                      ? const Text("Skip All")
                      : const Text(" ")))),
          Positioned(
            bottom: TDeviceUtils.getBottomNavigationBarHeight(),
            left: TSizes.defaultSpace,
            child: SmoothPageIndicator(
                controller: controller.pageController,
                count: 3,
                onDotClicked: controller.dotNavigationClick,
                effect: ExpandingDotsEffect(
                  activeDotColor: isDark ? TColors.accent : TColors.black,
                  dotHeight: 6,
                )),
          ),
          Positioned(
              bottom: TDeviceUtils.getBottomNavigationBarHeight() - 10,
              right: TSizes.defaultSpace,
              child: ElevatedButton(
                onPressed: () {
                  controller.nextPage();
                },
                child: const Icon(Icons.arrow_right),
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: TColors.primary),
              ))
        ],
      ),
    );
  }
}

class OnBoardingWidget extends StatelessWidget {
  OnBoardingWidget({
    super.key,
    required this.path,
    required this.title,
    required this.subTitle,
  });

  final path, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: THelperFunctions.screenWidth() * 0.8,
            height: THelperFunctions.screenHeight() * 0.6,
            image: AssetImage(path),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
