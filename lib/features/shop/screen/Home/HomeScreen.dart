import 'package:ecom/common/widgets/Appbar_SearchBar.dart';
import 'package:ecom/common/widgets/CustomCircle.dart';
import 'package:ecom/common/widgets/ViewMore_Divider.dart';
import 'package:ecom/features/authentication/controller/user_controller.dart';
import 'package:ecom/features/shop/screen/Home/widget/Banner_Section.dart';
import 'package:ecom/features/shop/screen/Home/widget/ClipPathWidget.dart';
import 'package:ecom/features/shop/screen/Home/widget/Grid_Builder.dart';
import 'package:ecom/features/shop/screen/Home/widget/Header_Appbar.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List BannerList = [
    TImages.banner1,
    TImages.banner2,
    TImages.banner3,
  ];
  final userController = Get.put(UserController());




  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ClippedPathHeader(
            clippedPathSection: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
          ()=> Header_AppBar(
                    appbarTitle: userController.user.value.email  ,
                    appbarSubTitle:  userController.user.value.fullName,
                    appbarActionIcon: Icons.store_mall_directory,
                  ),
                ),
                Appbar_SearchBar(),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, left: TSizes.defaultSpace),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Product Catergory",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .apply(color: TColors.white),
                      ),
                      Hortzontal_Scroll(
                        horizontalScrollIcons: [
                          TImages.clothIcon,
                          TImages.animalIcon,
                          TImages.furnitureIcon,
                          TImages.jeweleryIcon,
                          TImages.shoeIcon,
                          TImages.cosmeticsIcon,
                          TImages.toyIcon,
                          TImages.jeweleryIcon,
                          TImages.sportIcon
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Banner_Section(
            bannerImages: BannerList,
          ),
          ViewMore_Divider(title: "Popular Products"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                child: Grid_Builder(
              totalItemCount: 6,
              itemInOneLine: 2,
              cardTitleMain: [
                "Sneakers",
                "Shirt",
                "Sneakers",
                "Track Suit",
                "Shirt",
                "Jacket"
              ],
              store: "Nike",
              imagePath: [
                TImages.productImage19,
                TImages.productImage61,
                "assets/images/products/NikeAirJordonwhiteMagenta.png",
                TImages.productImage25,
                TImages.productImage69,
                TImages.productImage67,
              ],
              endPrice: 200.0,
              startPrice: 50.0,
              wishListed: false,
            )),
          ),
          ViewMore_Divider(title: "Popular Products"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Grid_Builder(
                  cardTitleMain: [
                    "Shirt",
                    "Collar Shirt",
                    "Track Suit",
                    "Jacket",
                    "Track Suit",
                    "Sneakers"
                  ],
                  endPrice: 300,
                  imagePath: [
                    TImages.productImage5,
                    TImages.productImage1,
                    TImages.productImage24,
                    TImages.productImage65,
                    TImages.productImage25,
                    TImages.productImage22
                  ],
                  startPrice: 100,
                  store: "Nike"),
            ),
          ),
        ],
      ),
    );
  }
}

class Hortzontal_Scroll extends StatelessWidget {
  const Hortzontal_Scroll({
    super.key,
    required this.horizontalScrollIcons,
  });
  final List<String> horizontalScrollIcons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: horizontalScrollIcons.length,
          itemBuilder: (_, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(9),
                          child: Image(
                            image: AssetImage(horizontalScrollIcons[index]),
                            height: 10,
                            width: 10,
                            // fit: BoxFit.contain,
                            alignment: Alignment.center,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          width: 50,
                          alignment: Alignment.center,
                          child: Text(
                            "Sports${index}",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .apply(color: TColors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ClippedPathHeader extends StatelessWidget {
  const ClippedPathHeader({
    super.key,
    required this.clippedPathSection,
    this.bgColor = TColors.primary,
  });

  final Widget clippedPathSection;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClipPathWidget(),
      child: Container(
        color: bgColor,
        child: Stack(
          children: [
            Custom_Circle(
              size: 300,
              positionX: -0.29,
              positionY: -0.1,
              opacity: 0.1,
            ),
            Custom_Circle(
              size: 300,
              positionX: -0.39,
              positionY: 0.1,
              opacity: 0.1,
            ),
            clippedPathSection
          ],
        ),
      ),
    );
  }
}
