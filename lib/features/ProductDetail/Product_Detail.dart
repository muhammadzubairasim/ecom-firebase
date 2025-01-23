import 'package:ecom/common/widgets/HeaderAppbar.dart';
import 'package:ecom/common/widgets/ViewMore_Divider.dart';
import 'package:ecom/common/widgets/WIshlist_Button.dart';
import 'package:ecom/features/ProductDetail/widgets/Product_Detail_Bottom.dart';
import 'package:ecom/features/shop/screen/Home/widget/ClipPathWidget.dart';
import 'package:ecom/features/shop/screen/Home/widget/Image_Portion.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:ecom/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class Product_Detail extends StatelessWidget {
  const Product_Detail({super.key, required this.imgPath, required this.sPrice, required this.ePrice, required this.cardTitle});
  final String imgPath ;
  final double sPrice ;
  final double ePrice ;
  final String cardTitle ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Product_Detail_Bottom(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: ClipPathWidget(),
              child: Container(
                color: TDeviceUtils.defaultColorIfDark(
                    context, TColors.darkerGrey, TColors.light),
                child: Stack(
                  children: [
                    HeaderAppbar(
                      backArrow: true,
                      customActions: [Wishlist_Button(wishListed: false)],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 70),
                      child: Center(
                          child: Custom_Image_Widget(
                        imgPath: imgPath,
                        hight: 250,
                      )),
                    ),
                    Product_Detail_Footer_Carousal(
                      imagePaths: [
                        TImages.productImage1,
                        TImages.productImage2,
                        TImages.productImage7,
                        TImages.productImage6
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Column(
                children: [
                  Row(
                    children: [
                      Yellow_Percentage_Button(percetage: "50"),
                      SizedBox(
                        width: TSizes.spaceBtwInputFields,
                      ),
                      Text(
                        "\$${sPrice}${ePrice != 0 ? "-" : ""}${ePrice != 0 ? "\$" +ePrice.toString() : ""}",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.share),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: TSizes.defaultSpace / 2),
                    child: Row(
                      children: [
                        Text(
                          cardTitle,
                          style: Theme.of(context).textTheme.labelMedium,
                        )
                      ],
                    ),
                  ),
                  Key_Value_Format(
                    title: "Stock",
                    value: "In-Stock",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Image(
                        image: AssetImage(TImages.nikeLogo),
                        height: 20,
                        width: 20,
                        color: TDeviceUtils.defaultColorIfDark(
                            context, TColors.light, TColors.dark),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "In Stock",
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.all(TSizes.defaultSpace),
                    padding: EdgeInsets.all(TSizes.defaultSpace),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: TColors.darkGrey),
                    child: Row(
                      children: [
                        Text(
                          "Validation",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .apply(color: Colors.black),
                        ),
                        SizedBox(
                          width: TSizes.spaceBtwInputFields,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Key_Value_Format(
                              value: "\$234",
                              title: "Price: ",
                              textColor: TColors.black,
                            ),
                            Key_Value_Format(
                              value: "out of stock",
                              title: "stock: ",
                              textColor: TColors.black,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  ViewMore_Divider(
                    title: "Colors",
                    trailingButtom: false,
                  ),
                  Wrap(
                    children: [
                      Product_Detail_Selector(
                        selectType: "color",
                        value: "Yellow",
                        onSelected: (val) {},
                        selected: false,
                      ),
                      Product_Detail_Selector(
                        selectType: "color",
                        value: "Red",
                        onSelected: (val) {},
                        selected: false,
                      ),
                      Product_Detail_Selector(
                        selectType: "color",
                        value: "Purple",
                        onSelected: (val) {},
                        selected: true,
                      ),
                    ],
                  ),
                  ViewMore_Divider(
                    title: "Sizes",
                    trailingButtom: false,
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      Product_Detail_Selector(
                        selectType: "button",
                        value: "EU 32",
                        selected: false,
                      ),
                      Product_Detail_Selector(
                        selectType: "button",
                        value: "EU 32",
                        selected: false,
                        onSelected: (val) {},
                      ),
                      Product_Detail_Selector(
                        selectType: "button",
                        value: "EU 32",
                        selected: true,
                        onSelected: (val) {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: TSizes.defaultSpace*1.5,
                  ),
                  Container(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: Text("Check-out"))),
                  SizedBox(
                    height: TSizes.defaultSpace*1.5,
                  ),
                  Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Description ",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          "product description is here ",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Product_Detail_Selector extends StatelessWidget {
  Product_Detail_Selector({
    super.key,
    required this.selectType,
    required this.value,
    this.onSelected,
    this.selected = false,
  });

  final String selectType;
  String value;
  void Function(bool)? onSelected;
  bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ChoiceChip(
        label: selectType == "color" ? SizedBox() : Text(value),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? TColors.white : null),
        avatar: selectType == "color"
            ? CircleAvatar(
                backgroundColor: THelperFunctions.getColor(value),
              )
            : null,
        labelPadding: EdgeInsets.all(0),
        padding:
            EdgeInsets.all(selectType == "color" ? 1 : TSizes.buttonRadius),
        shape: selectType == "color" ? CircleBorder() : null,
        backgroundColor:
            selectType == "color" ? THelperFunctions.getColor(value) : null,
      ),
    );
  }
}

class Key_Value_Format extends StatelessWidget {
  Key_Value_Format({
    super.key,
    required this.value,
    required this.title,
    this.textColor = null,
  });

  String title;

  Color? textColor;
  String value;

  @override
  Widget build(BuildContext context) {
    if (textColor == null)
      TDeviceUtils.defaultColorIfDark(context, TColors.white, TColors.black);
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .apply(color: textColor != null ? textColor : TColors.grey),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge!.apply(color: textColor),
        )
      ],
    );
  }
}

class Product_Detail_Footer_Carousal extends StatelessWidget {
  Product_Detail_Footer_Carousal({
    super.key,
    required this.imagePaths,
  });

  List<String> imagePaths;

  @override
  Widget build(BuildContext context) {
    bool selected;
    return Positioned(
      bottom: 30,
      left: TSizes.defaultSpace * 2,
      right: 0,
      child: SizedBox(
        height: 85,
        child: ListView.separated(
          separatorBuilder: (_, __) => SizedBox(
            width: TSizes.defaultSpace,
          ),
          itemCount: imagePaths.length,
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: TColors.primary),
                    borderRadius: BorderRadius.circular(8.0),
                    color: TDeviceUtils.defaultColorIfDark(
                            context, TColors.dark, TColors.light)
                        .withOpacity(0.7)),
                child: Custom_Image_Widget(
                  imgPath: imagePaths[index],
                  hight: 80,
                  width: 80,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Custom_Image_Widget extends StatelessWidget {
  Custom_Image_Widget({
    super.key,
    this.hight,
    this.width,
    required this.imgPath,
    this.isNetworkImg = false,
  });

  double? hight;
  double? width;
  String imgPath;
  bool isNetworkImg;

  @override
  Widget build(BuildContext context) {
    return Image(
      height: hight != null ? hight : null,
      width: width != null ? width : null,
      image: AssetImage(imgPath),
    );
  }
}
