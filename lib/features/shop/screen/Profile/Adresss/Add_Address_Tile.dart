import 'package:ecom/common/widgets/HeaderAppbar.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class Add_Address_Tile extends StatelessWidget {
  const Add_Address_Tile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderAppbar(
        backArrow: true,
        customTitle: Text("Add Shipping Address"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.abc),
                        labelText: "Name",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: TSizes.spaceBtwInputFields * 1.5,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.numbers),
                        labelText: "Phone No",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: TSizes.spaceBtwInputFields * 1.5,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      maxLines: 4,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.location_history_rounded),
                          hintText: "123-A Block xyz , pakistan",
                          hintStyle: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .apply(
                                  color: TDeviceUtils.defaultColorIfDark(
                                          context, TColors.white, TColors.dark)
                                      .withOpacity(0.3)),
                          hintFadeDuration: Duration(milliseconds: 500)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: TSizes.defaultSpace*3,
              ),
              Container(
                width: TDeviceUtils.getScreenWidth(context) / 2.5,
                  child: ElevatedButton(
                onPressed: () {},
                child: Text("Save"),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
