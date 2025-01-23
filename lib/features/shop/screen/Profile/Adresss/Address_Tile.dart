import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class Address_Tile extends StatelessWidget {
  Address_Tile({
    super.key,
    this.selected = false,
  });

  bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){},
        child: Container(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          decoration: BoxDecoration(
              color: selected
                  ? Color.fromARGB(150, 101, 110, 155)
                  : TDeviceUtils.defaultColorIfDark(
                      context, TColors.dark, TColors.lightGrey),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              border: selected? Border.all(color: TDeviceUtils.defaultColorIfDark(context, Colors.white24, Colors.black12), width: 2) : Border.all(color: TDeviceUtils.defaultColorIfDark(context, Colors.white10, Colors.black12) , width: 2),),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                      flex: 9,
                      child: Text(
                        "Muhammad Zubair Asim",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(fontWeightDelta: 300),
                      )),
                  if (selected)
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.fmd_good_outlined,
                        color: Colors.black,
                        size: TSizes.iconLg,
                      ),
                    ),
                ],
              ),
              Text(
                "03074051817",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                "564-A Tajpura Scheme Mughalpura Scheme Lahore",
                style: Theme.of(context).textTheme.labelMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}
