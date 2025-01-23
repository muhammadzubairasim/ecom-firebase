import 'package:ecom/common/widgets/Appbar_ActionIcon.dart';
import 'package:ecom/common/widgets/Appbar_SearchBar.dart';
import 'package:ecom/common/widgets/HeaderAppbar.dart';
import 'package:ecom/common/widgets/ViewMore_Divider.dart';
import 'package:ecom/features/shop/screen/Home/widget/Grid_Builder.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  StoreScreen({super.key, this.back = false});

  final List<String> imagePaths = [
    TImages.jordanLogo,
    TImages.adidasLogo,
    TImages.kenwoodLogo,
    TImages.hermanMillerLogo,
    TImages.acerlogo,
    TImages.appleLogo,


  ];

  final List<String> FeaturedBrandImages = [
    TImages.jordanLogo,
    TImages.adidasLogo,
    TImages.kenwoodLogo,
    TImages.hermanMillerLogo,
  ];



  final List<String> titles = ["Jorden", "Addidas", "Kenwood", "Herman"];
  List<String> subtitles = [
    "Jorden-store",
    "Addidas-store",
    "Kenwood",
    "herman-miller",
    "Acer",
    "Apple"
  ];
  List<Text> tabHeading = [
    Text("Shoes"),
    Text("Furniture"),
    Text("Electronics"),
    Text("Cloths")
  ];
  bool back;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabHeading.length,
      child: Scaffold(
        appBar: HeaderAppbar(
          backArrow: false,
          customTitle: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          customActions: [
            Appbar_ActionIcon(
              appbarActionIcon: Icons.store_mall_directory,
              count: 7,
            )
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  pinned: true,
                  backgroundColor: TDeviceUtils.defaultColorIfDark(
                      context, TColors.black, TColors.white),
                  floating: true,
                  expandedHeight:
                      TDeviceUtils.getScreenWidth(context) < 350 ? 500 : 380,
                  flexibleSpace: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Appbar_SearchBar(),
                      SizedBox(
                        height: 20,
                      ),
                      ViewMore_Divider(title: "Featured Brands"),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: TSizes.defaultSpace),
                        child: GridView.builder(
                            itemCount: FeaturedBrandImages.length,
                            shrinkWrap: true,
                            // physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        TDeviceUtils.getScreenWidth(context) <
                                                350
                                            ? 1
                                            : 2,
                                    mainAxisExtent: 70,
                                    mainAxisSpacing: 5,
                                    crossAxisSpacing: 5),
                            itemBuilder: (_, index) {
                              return Store_Grid_Element(
                                ImagePath: FeaturedBrandImages[index],
                                title: titles[index],
                                subtitle: subtitles[index],
                              );
                            }),

                      )
                    ],
                  ),
                  bottom: Tabbar_widget(
                    myTabs: tabHeading,
                  ),
                ),
              ];
            },
            body: TabBarView(
              // physics: AlwaysScrollableScrollPhysics(),
              children: [
                GestureDetector(//shoes
                  child: Tabbar_Structure(
                    tabbarWidgetList: [
                      Store_tabbar_Card(
                        imagePaths: imagePaths[0],
                        titles: titles[0],
                        subtitles: subtitles[0],
                        cardBottomImages: [
                          TImages.productImage1,
                          TImages.productImage2,
                          TImages.productImage3
                        ],
                      ),
                      Store_tabbar_Card(
                        imagePaths: imagePaths[1],
                        titles: titles[1],
                        subtitles: subtitles[1],
                        cardBottomImages: [
                          TImages.productImage4,
                          TImages.productImage5,
                          TImages.productImage6
                        ],
                      ),
                      ViewMore_Divider(title: "You Might Like "),
                      Grid_Builder(
                          cardTitleMain: ["Green Sports SHoes "],
                          store: "Nike",
                          imagePath: [TImages.productImage1,TImages.productImage2,TImages.productImage3,TImages.productImage4,TImages.productImage5,TImages.productImage6,TImages.productImage23,TImages.productImage12,],
                          endPrice: 100,
                          startPrice: 50),
                    ],
                  ),
                ),
                Tabbar_Structure(// furniture
                  tabbarWidgetList: [
                    Store_tabbar_Card(
                      imagePaths: imagePaths[2],
                      titles: titles[2],
                      subtitles: subtitles[2],
                      cardBottomImages: [
                        TImages.productImage33,
                        TImages.productImage34,
                        TImages.productImage35
                      ],
                    ),
                    Store_tabbar_Card(
                      imagePaths: imagePaths[3],
                      titles: titles[3],
                      subtitles: subtitles[3],
                      cardBottomImages: [
                        TImages.productImage36,
                        TImages.productImage37,
                        TImages.productImage38,
                      ],
                    ),
                    ViewMore_Divider(title: "You Might Like "),
                    Grid_Builder(
                        cardTitleMain: ["Green Sports SHoes "],
                        store: "Nike",
                        imagePath: [TImages.productImage39,TImages.productImage40,TImages.productImage41,TImages.productImage42,TImages.productImage43,TImages.productImage44,TImages.productImage45,TImages.productImage46,],
                        endPrice: 100,
                        startPrice: 50),
                  ],
                ),
                Tabbar_Structure(//electronics
                  tabbarWidgetList: [
                    Store_tabbar_Card(
                      imagePaths: imagePaths[2],
                      titles: titles[2],
                      subtitles: subtitles[2],
                      cardBottomImages: [
                        TImages.productImage47,
                        TImages.productImage48,
                        TImages.productImage49
                      ],
                    ),
                    Store_tabbar_Card(
                      imagePaths: imagePaths[3],
                      titles: titles[3],
                      subtitles: subtitles[3],
                      cardBottomImages: [
                        TImages.productImage50,
                        TImages.productImage51,
                        TImages.productImage52
                      ],
                    ),
                    ViewMore_Divider(title: "You Might Like "),
                    Grid_Builder(
                        cardTitleMain: ["ELectronics"],
                        store: "Electronics",
                        imagePath: [TImages.productImage53,TImages.productImage54,TImages.productImage55,TImages.productImage56,TImages.productImage57,TImages.productImage58,TImages.productImage59,TImages.productImage60,],
                        endPrice: 100,
                        startPrice: 50),
                  ],
                ),
                Tabbar_Structure(
                  tabbarWidgetList: [
                    Store_tabbar_Card(
                      imagePaths: imagePaths[0],
                      titles: "Electronic",
                      subtitles: "Electronic",
                      cardBottomImages: [
                        TImages.productImage18,
                        TImages.productImage19,
                        TImages.productImage20
                      ],
                    ),
                    Store_tabbar_Card(
                      imagePaths: imagePaths[1],
                      titles: "Electronic",
                      subtitles: "Electronic",
                      cardBottomImages: [
                        TImages.productImage21,
                        TImages.productImage22,
                        TImages.productImage23
                      ],
                    ),
                    ViewMore_Divider(title: "You Might Like "),
                    Grid_Builder(
                        cardTitleMain: ["Green Sports SHoes "],
                        store: "Nike",
                        imagePath: [TImages.productImage17,TImages.productImage26,TImages.productImage37,TImages.productImage42,TImages.productImage51,TImages.productImage65,TImages.productImage23,TImages.productImage52,],
                        endPrice: 100,
                        startPrice: 50),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

class Tabbar_Structure extends StatelessWidget {
  Tabbar_Structure({
    super.key,
    required this.tabbarWidgetList,
  });

  final List<Widget> tabbarWidgetList;
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      shrinkWrap: true,
      // physics: NeverScrollableScrollPhysics(),
      children: tabbarWidgetList.map((e) => e).toList(),
    );
  }
}

class Store_tabbar_Card extends StatelessWidget {
  const Store_tabbar_Card(
      {super.key,
      required this.imagePaths,
      required this.titles,
      required this.subtitles,
      required this.cardBottomImages});

  final String imagePaths;
  final String titles;
  final String subtitles;
  final List<String> cardBottomImages;

  @override
  Widget build(BuildContext context) {
    return Padding(
      //1
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: TDeviceUtils.defaultColorIfDark(
                    context, TColors.grey, TColors.black),
              ),
            ),
            child: Column(
              children: [
                Store_Grid_Element(
                  ImagePath: imagePaths,
                  title: titles,
                  border: false,
                  subtitle: subtitles,
                ),
                Row(
                  children: cardBottomImages
                      .map((imagePath) => Expanded(
                            child: Image(
                              height: 100,
                              fit: BoxFit.contain,
                              image: AssetImage(imagePath),
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Tabbar_widget extends StatelessWidget implements PreferredSize {
  const Tabbar_widget({super.key, required this.myTabs});

  final List<Widget> myTabs;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: TDeviceUtils.defaultColorIfDark(
          context, TColors.black, TColors.white),
      padding: EdgeInsets.only(top: TSizes.defaultSpace),
      child: TabBar(
          physics: const NeverScrollableScrollPhysics(),
          indicatorColor: TDeviceUtils.defaultColorIfDark(
              context, TColors.lightGrey, TColors.primary),
          labelColor: TColors.white,
          //  labelColor: TColors.accent,
          tabs: myTabs),
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}

class Store_Grid_Element extends StatelessWidget {
  const Store_Grid_Element(
      {super.key,
      this.ImagePath,
      this.title,
      this.subtitle = null,
      this.border = true});

  final String? ImagePath;
  final String? title;
  final String? subtitle;
  final bool border;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        border: border
            ? Border.all(color: TColors.grey, width: 1.0)
            : Border.all(color: TColors.black, width: 0.0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            top: TSizes.defaultSpace / 2,
            bottom: TSizes.defaultSpace / 2,
            left: TSizes.defaultSpace / 2),
        child: Row(
          children: [
            Flexible(
              child: Image(
                height: 60,
                width: 60,
                image: AssetImage(ImagePath!),
                color: TDeviceUtils.defaultColorIfDark(
                    context, TColors.light, TColors.dark),
              ),
            ),
            SizedBox(
              width: TDeviceUtils.getScreenWidth(context) * 0.01,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title!,
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(fontWeightDelta: 2),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: TSizes.spaceBtwInputFields / 3,
                      ),
                      Icon(
                        Icons.verified,
                        color: Colors.blue,
                        size: TSizes.iconXs,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: Theme.of(context).textTheme.labelSmall,
                      overflow: TextOverflow.ellipsis,
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
