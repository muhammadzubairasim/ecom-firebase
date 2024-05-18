import 'package:ecom/common/widgets/Divider.dart';
import 'package:ecom/common/widgets/Icons_Footer.dart';
import 'package:ecom/features/authentication/screen/Email_verificationScreen.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/constants/text_strings.dart';
import 'package:ecom/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ecom/common/Controller/signup_controller.dart';

class Signup_Screen extends StatelessWidget {
  const Signup_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace * 2),
          child: Form(
            key: controller.signupFormKey,
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
                      controller: controller.firstname,
                      validator: (value) =>
                          TValidator.validateEmptyText('firstname', value),
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
                      controller: controller.lastname,
                      validator: (value) =>
                          TValidator.validateEmptyText('lasttname', value),
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
                    controller: controller.username,
                    validator: (value) =>
                        TValidator.validateEmptyText('username', value),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.man_4_sharp),
                      labelText: TTexts.username,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
                  child: TextFormField(
                    controller: controller.email,
                    validator: (value) => TValidator.validateEmail(value),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      labelText: TTexts.email,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
                  child: TextFormField(
                    controller: controller.phoneNumber,
                    validator: (value) => TValidator.validatePhoneNumber(value),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      labelText: TTexts.phoneNo,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
                  child: Obx(
                    () => TextFormField(
                      controller: controller.password,
                      validator: (value) => TValidator.validatePassword(value),
                      obscureText: controller.hidePassword.value,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_person_outlined),
                          labelText: TTexts.password,
                          suffixIcon: IconButton(
                              onPressed: () => controller.hidePassword.value =
                                  !controller.hidePassword.value,
                              icon: Icon(controller.hidePassword.value
                                  ? Iconsax.eye_slash
                                  : Iconsax.eye))),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.privacyPolicy.value,
                        onChanged: (value) {
                          controller.privacyChecked();
                        },
                      ),
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
                        controller.signup();
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
