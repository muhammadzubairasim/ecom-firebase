import 'package:ecom/common/widgets/Appbar_ActionIcon.dart';
import 'package:ecom/common/widgets/HeaderAppbar.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class Header_AppBar extends StatelessWidget {
  const Header_AppBar(
      {super.key,
      required this.appbarTitle,
      this.appbarSubTitle = null,
      this.appbarActionIcon});

  final String? appbarTitle, appbarSubTitle;

  final IconData? appbarActionIcon;

  @override
  Widget build(BuildContext context) {
    return HeaderAppbar(
      backArrow: false,
      customTitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            appbarTitle.toString(),
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.grey),
          ),
          if (appbarSubTitle != null)
            Text(
              appbarSubTitle.toString(),
              style: Theme.of(context).textTheme.headlineMedium!.apply(
                    color: TColors.grey,
                  ),
            )
        ],
      ),
      customActions: [
        Appbar_ActionIcon(
          appbarActionIcon: Icons.store_mall_directory,
          count: 7,
        ),
      ],
    );
  }
}
