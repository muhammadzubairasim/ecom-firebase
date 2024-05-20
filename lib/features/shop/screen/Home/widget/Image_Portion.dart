import 'package:ecom/common/widgets/WIshlist_Button.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:flutter/material.dart'
;
class Image_Portion extends StatelessWidget {
  const Image_Portion({super.key,
  required this.imagePath,
  this.percetage = "0",
  this.wishListed = false
  }
);

  final String imagePath;
  final String percetage;
  final bool wishListed ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: TDeviceUtils.defaultColorIfDark(
              context, TColors.darkerGrey, TColors.grey)
          .withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Image(
                  // height: 400,
                  image: AssetImage(imagePath),
                  // fit: BoxFit.cover,
                ),
              ),
            ),
            Yellow_Percentage_Button(percetage: percetage),
            Positioned(
              right: 0,
              top: 0,
              child: Wishlist_Button(wishListed: wishListed,)
            )
          ],
        ),
      ),
    );
  }
}

class Yellow_Percentage_Button extends StatelessWidget {
  const Yellow_Percentage_Button({
    super.key,
    required this.percetage,
  });

  final String percetage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: Text(
          "${percetage}%",
          style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: TColors.black,
              ),
        ),
      ),
    );
  }
}

