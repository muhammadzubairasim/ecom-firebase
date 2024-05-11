import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
class ViewMore_Divider extends StatelessWidget {
  const ViewMore_Divider({
    super.key,
    required this.title, this.trailingButtom = true,
  });
  final String title;
  final bool trailingButtom ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          if(trailingButtom !=false) TextButton(onPressed: () {}, child: Text("View more")),
        ],
      ),
    );
  }
}
