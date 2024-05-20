import 'package:ecom/common/widgets/HeaderAppbar.dart';
import 'package:ecom/common/widgets/ViewMore_Divider.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:ecom/features/authentication/authentication_repository.dart';

class Profile_Info extends StatelessWidget {
  const Profile_Info({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepo = AuthenticationRepository();
    return Scaffold(
      appBar: HeaderAppbar(
        customTitle: Text("Profile Setting"),
        backArrow: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: TSizes.defaultSpace),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                      backgroundImage: AssetImage(TImages.user), radius: 30),
                  TextButton(
                      onPressed: () {}, child: Text("Change Profile Picture")),
                ],
              ),
            ),
            Divider(
              color: TDeviceUtils.defaultColorIfDark(
                  context,
                  TColors.grey.withOpacity(0.2),
                  TColors.black.withOpacity(0.2)),
              thickness: 2,
              endIndent: TSizes.defaultSpace,
              indent: TSizes.defaultSpace,
            ),
            ViewMore_Divider(
              title: "Profile Information",
              trailingButtom: false,
            ),
            Profile_Edit_Tiles(
              attributes: "Name",
              value: "Muhammad Zubair Asim",
            ),
            Profile_Edit_Tiles(
              attributes: "username",
              value: "zubairasim7",
            ),
            ViewMore_Divider(
                title: "Personal Information", trailingButtom: false),
            Profile_Edit_Tiles(
              attributes: "user ID",
              value: "07412",
              editIcon: Icons.copy,
            ),
            Profile_Edit_Tiles(
                attributes: "Email", value: "zubairasim7@gmail.com"),
            Profile_Edit_Tiles(attributes: "Phone no", value: "030740151817"),
            Profile_Edit_Tiles(attributes: "Gender", value: "male"),
            Divider(
              color: TDeviceUtils.defaultColorIfDark(
                  context,
                  TColors.grey.withOpacity(0.2),
                  TColors.black.withOpacity(0.2)),
              thickness: 2,
              endIndent: TSizes.defaultSpace,
              indent: TSizes.defaultSpace,
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () => authRepo.logout(),
                child: Text(
                  "Close Account",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .apply(color: TColors.error),
                ))
          ],
        ),
      ),
    );
  }
}

class Profile_Edit_Tiles extends StatelessWidget {
  const Profile_Edit_Tiles({
    super.key,
    required this.attributes,
    required this.value,
    this.editIcon = Icons.arrow_forward_ios,
  });
  final String attributes;
  final String value;
  final IconData editIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Text(
                attributes,
                style: Theme.of(context).textTheme.labelMedium,
              )),
          Expanded(
              flex: 5,
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodyLarge,
              )),
          IconButton(
            onPressed: () {},
            icon: Icon(editIcon),
            iconSize: TSizes.iconSm,
          )
        ],
      ),
    );
  }
}
