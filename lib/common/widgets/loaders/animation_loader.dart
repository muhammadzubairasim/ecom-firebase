import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TAnimationLoaderWidget extends StatelessWidget {
  /// Default constructor for the TAnimationLoaderWidget.
  const TAnimationLoaderWidget({
    Key? key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  }) : super(key: key);

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Lottie.asset(
          //   animation,
          //   width: MediaQuery.of(context).size.width * 0.8,
          // ),
          const SizedBox(height: TSizes.defaultSpace),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ), // Text
          const SizedBox(height: TSizes.defaultSpace),
          if (showAction)
            SizedBox(
              width: 250,
              child: OutlinedButton(
                onPressed: onActionPressed,
                style: OutlinedButton.styleFrom(backgroundColor: TColors.dark),
                child: Text(
                  actionText!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: TColors.white), // Text
                ), // OutlinedButton
              ), // SizedBox
            ), // if
          const SizedBox(),
        ],
      ),
    );
  }
}
