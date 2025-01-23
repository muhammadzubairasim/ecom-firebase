import 'package:ecom/common/widgets/BottomNavBar.dart';
import 'package:ecom/common/widgets/Divider.dart';
import 'package:ecom/common/widgets/Icons_Footer.dart';
import 'package:ecom/features/authentication/controller/login_controller.dart';
import 'package:ecom/features/authentication/screen/ForgetPassword.dart';
import 'package:ecom/features/authentication/screen/Signup_Sceen.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/constants/text_strings.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:ecom/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Login_Screen extends StatelessWidget {
  const Login_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Image(
                    height: 150,
                    image: AssetImage(
                      TImages.lightAppLogo,
                    ),
                  ),
                  Text(
                    TTexts.loginTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: TSizes.sm,
                  ),
                  Text(
                    TTexts.loginSubTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 16.0),
                child: Form(
                  key: controller.LoginFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: controller.email,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.arrow_right),
                          labelText: TTexts.email,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Obx(
                        () => TextFormField(
                          controller: controller.password,
                          validator: (value) =>
                              TValidator.validatePassword(value),
                          obscureText: controller.hidePassword.value,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_person_outlined),
                            labelText: TTexts.password,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.hidePassword.value =
                                      !controller.hidePassword.value;
                                },
                                icon: Icon(controller.hidePassword.value
                                    ? Iconsax.eye_slash
                                    : Iconsax.eye)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Obx(() => Checkbox(
                                    value: controller.rememberme.value,
                                    onChanged: (value) => controller.rememberme
                                        .value = !controller.rememberme.value,
                                  )),
                              Text(TTexts.rememberMe),
                            ],
                          ),
                          TextButton(
                              onPressed: () {
                                Get.to(ForgetPassword());
                              },
                              child: Text(TTexts.forgetPassword)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.emailAndPasswordSignIn();
                            },
                            child: Text("Sign in"),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
                        child: SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              child: Text(TTexts.createAccount),
                              onPressed: () {
                                Get.to(() => Signup_Screen());
                              },
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Divider_Widget(),
              Icons_Footer()
            ],
          ),
        ),
      ),
    );
  }
}
