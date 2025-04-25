import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:bhagwatiassociate/features/auth/controllers/login_controller/logincontroller.dart';
import 'package:bhagwatiassociate/utils/constants/colors.dart';
import 'package:bhagwatiassociate/utils/constants/sizes.dart';
import 'package:bhagwatiassociate/utils/constants/text_str.dart';
import 'package:bhagwatiassociate/utils/validators/validation.dart';

import '../../../../../navigation_menu.dart';
import '../../../../Dashboard/screens/dashboard_screen.dart';

class SLoginForm extends StatelessWidget {
  const SLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController controller = Get.put(loginController());
    return Form(
        key: controller.loginformKey,
        child: Column(
          children: [
            // email field
            TextFormField(
              controller: controller.emailController,
              validator: (value) => SValidator.validEmail(value),
              cursorColor: SColors.primary,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email Address',
                prefixIcon: Icon(Icons.email, color: SColors.primary), // Email icon
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: SColors.primary,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: Sizes.spaceBtwInputFields,
            ),
            Obx(
                  () => TextFormField(
                controller: controller.passwordController,
                validator: (value) => SValidator.validatePassword(value),
                cursorColor: Theme.of(context).primaryColor,
                obscureText: controller.obscureText.value,
                decoration: InputDecoration(
                  labelText: STexts.password,
                  prefixIcon: const Icon(Icons.lock, color: SColors.primary), // Password icon
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.obscureText.value ? Iconsax.eye_slash : Iconsax.eye,
                    ),
                    onPressed: () => controller.obscureText.value =
                    !controller.obscureText.value,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: Sizes.spaceBtwInputFields / 2,
            ),
            // remember me & forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remember me
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onChanged: (value) {},
                    ),
                    Text(STexts.rememberMe,
                        style: Theme.of(context).textTheme.labelLarge),
                  ],
                ),
                // forget password
                // TextButton(
                //     onPressed: () {},
                //     child: const Text(
                //       STexts.fgtPwd,
                //     )),
              ],
            ),
            const SizedBox(
              height: Sizes.spaceBtwItems,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: Theme.of(context).elevatedButtonTheme.style,
                    // onPressed: controller.login,
                    onPressed: () => Get.offAll(() => const DashboardScreen()),
                    child: const Text(STexts.signIn))),
          ],
        ));
  }
}