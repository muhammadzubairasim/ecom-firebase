import 'package:ecom/common/widgets/Divider.dart';
import 'package:ecom/common/widgets/Icons_Footer.dart';
import 'package:ecom/features/authentication/screen/Email_verificationScreen.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup_Screen extends StatelessWidget {
  const Signup_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace * 2),
          child: Form(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(TSizes.spaceBtwItems),
                  child: Text(
                    TTexts.signupTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_circle_outlined),
                        labelText: TTexts.firstName,
                      ),
                    )),
                    SizedBox(
                      width: TSizes.spaceBtwInputFields,
                    ),
                    Expanded(
                        child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_circle_outlined),
                        labelText: TTexts.lastName,
                      ),
                    )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: TSizes.spaceBtwItems),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.man_4_sharp),
                      labelText: TTexts.username,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      labelText: TTexts.email,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      labelText: TTexts.phoneNo,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_person_outlined),
                        labelText: TTexts.password,
                        suffixIcon: IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: () {},
                        )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(TTexts.iAgreeTo),
                          TextButton(
                              onPressed: () {},
                              child: Text(TTexts.privacyPolicy)),
                          Text("and"),
                          TextButton(
                              onPressed: () {}, child: Text(TTexts.termsOfUse))
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(Email_Verification_Screen());
                      },
                      child: Text(TTexts.createAccount),
                    ),
                  ),
                ),
                Divider_Widget(),
                Icons_Footer(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          Get.back();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
    );
  }
}
