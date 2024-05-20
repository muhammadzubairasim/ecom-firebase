import "package:ecom/utils/constants/sizes.dart";
import "package:flutter/material.dart";
class Card_Second_Portion extends StatelessWidget {
  const Card_Second_Portion({
    super.key,
    required this.cardTitle,
    required this.store,
  });

  final String cardTitle, store;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: TSizes.defaultSpace * 0.5,
            horizontal: TSizes.defaultSpace * 0.7),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          // here text is not coming to center
          children: [
            Text(cardTitle,
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .apply(overflow: TextOverflow.ellipsis)),
            SizedBox(
              height: 8,
            ),
            Brand_Verified(store: store)
          ],
        ),
      ),
    );
  }
}

class Brand_Verified extends StatelessWidget {
  const Brand_Verified({
    super.key,
    required this.store,
    this.verified = true
  });

  final String store;
  final bool verified;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(store),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child:  verified ? Icon(
            Icons.verified,
            color: Colors.blue,
            size: TSizes.iconSm,
          ) : null,
        ),
      ],
    );
  }
}
