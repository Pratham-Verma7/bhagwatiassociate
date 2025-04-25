import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:bhagwatiassociate/features/auth/controllers/registration/registercontroller.dart';
import 'package:bhagwatiassociate/utils/constants/colors.dart';
import 'package:bhagwatiassociate/utils/constants/sizes.dart';
import 'package:bhagwatiassociate/utils/constants/text_str.dart';
import 'package:bhagwatiassociate/utils/validators/validation.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    // final Dobcontroller dobController = Get.put(Dobcontroller());
    return Form(
        key: controller.signUpFormKey,
        // autovalidateMode: AutovalidateMode.onUnfocus,
        child: Column(
          children: [
            // name
            Row(children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  controller: controller.firstNameController,
                  validator: (value) =>
                      SValidator.validateEmptyText('First Name', value),
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: const InputDecoration(
                    labelText: STexts.firstName,
                    // prefixIcon: Icon(Icons.person, color: SColors.primary),
                  ),
                ),
              ),
              const SizedBox(
                width: Sizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.lastNameController,
                  validator: (value) =>
                      SValidator.validateEmptyText('Last Name', value),
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: const InputDecoration(
                    labelText: STexts.lastName,
                  ),
                ),
              ),
            ]),
            const SizedBox(
              height: Sizes.spaceBtwInputFields,
            ),

            // email
            TextFormField(
              controller: controller.emailController,
              validator: (value) => SValidator.validEmail(value),
              keyboardType: TextInputType.emailAddress,
              cursorColor: Theme.of(context).primaryColor,
              decoration: const InputDecoration(
                labelText: STexts.email,
                // prefixIcon: Icon(Icons.email, color: SColors.primary),
              ),
            ),
            const SizedBox(
              height: Sizes.spaceBtwInputFields,
            ),

            // phone number
            SIntlPhoneField(controller: controller),
            const SizedBox(
              height: Sizes.spaceBtwInputFields,
            ),
            // DOB
            TextFormField(
              controller: controller.dobController,
              validator: (value) =>
                  SValidator.validateEmptyText('Date of Birth', value),
              cursorColor: Theme.of(context).primaryColor,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: STexts
                    .dob, // Replace STexts.dob with a string for simplicity
                hintText:
                    STexts.dobHint, // Replace  with a string for simplicity
                // prefixIcon: IconButton(
                //   icon: const Icon(
                //     Icons.calendar_today,
                //     color: SColors.primary,
                //   ),
                //   onPressed: () => dobController.pickDate(context),
                // ),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.edit_calendar,
                    color: SColors.grey,
                  ),
                  onPressed: () => controller.pickDate(context),
                ),
              ),
              readOnly: false,
            ),
            const SizedBox(
              height: Sizes.spaceBtwInputFields,
            ),

            // gender
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  STexts.gender,
                ),
                Obx(() => Row(
                      children: [
                        Radio<String>(
                          value: 'Male',
                          activeColor: SColors.primary,
                          groupValue: controller.gender.value,
                          onChanged: (value) {
                            controller.gender.value = value!;
                          },
                        ),
                        const Text(
                          'Male',
                        ),
                      ],
                    )),
                Obx(() => Row(
                      children: [
                        Radio<String>(
                          value: 'Female',
                          activeColor: SColors.primary,
                          groupValue: controller.gender.value,
                          onChanged: (value) {
                            controller.gender.value = value!;
                          },
                        ),
                        const Text(
                          'Female',
                        ),
                      ],
                    )),

                // Obx(() => Row(
                //       children: [
                //         Radio<String>(
                //           value: 'Other',
                //           groupValue: controller.gender.value,
                //           onChanged: (value) {
                //             controller.gender.value = value!;
                //           },
                //         ),
                //         const Text('Other'),
                //       ],
                //     )),
              ],
            ),
            const Divider(
              thickness: 1,
              color: SColors.lightGrey,
            ),
            const SizedBox(
              height: Sizes.spaceBtwInputFields,
            ),
            // password
            Obx(
              () => TextFormField(
                controller: controller.passwordController,
                validator: (value) => SValidator.validatePassword(value),
                cursorColor: Theme.of(context).primaryColor,
                obscureText: controller.obscureText.value,
                decoration: InputDecoration(
                  labelText: STexts.password,
                  // prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.obscureText.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye,
                    ),
                    onPressed: () => controller.obscureText.value =
                        !controller.obscureText.value,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: Sizes.spaceBtwInputFields,
            ),
            // verify password
            TextFormField(
              controller: controller.passwordVerifyController,
              validator: (value) => SValidator.checkPasswordMatch(
                  controller.passwordController.text,
                  controller.passwordVerifyController.text),
              cursorColor: Theme.of(context).primaryColor,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: STexts.verifyPassword,
                // prefixIcon: Icon(Icons.lock),
                // suffixIcon: IconButton(
                //   icon: const Icon(Icons.visibility),
                //   onPressed: () {
                //     controller.obscureText = !controller.obscureText;
                //     controller.update();
                //   },
                // ),
              ),
            ),
            const SizedBox(
              height: Sizes.spaceBtwInputFields,
            ),
            // terms and conditions
            const termsAndConditionCheckbox(),
            const SizedBox(
              height: Sizes.spaceBtwSections,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: Theme.of(context).elevatedButtonTheme.style,
                    onPressed: controller.submitForm,
                    // onPressed: () => Get.to(() => const VerifyOtp()),
                    child: const Text(STexts.reigsterElvBtn))),
          ],
        ));
  }
}

class SIntlPhoneField extends StatelessWidget {
  const SIntlPhoneField({
    super.key,
    required this.controller,
  });

  final RegisterController controller;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      cursorColor: SColors.primary,
      // controller: controller.mobileNumberController,
      onChanged: (value) => controller.phone.value = PhoneNumber(
          countryCode: value.countryCode,
          number: value.number,
          countryISOCode: value.countryISOCode),

      // onSaved: (newValue) => controller.mobileNumberController = 'newValue.countryCode',
      // focusNode: focusNode,'
      decoration: const InputDecoration(
        labelText: 'Mobile Number',
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: SColors.primary,
          ),
        ),
      ),
      languageCode: "en",
      initialCountryCode: "IN",
    );
  }
}

class termsAndConditionCheckbox extends StatelessWidget {
  const termsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = RegisterController.instance;
    return Row(
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Obx(
            () => Checkbox(
              value: controller.acceptTermsAndConditions.value,
              onChanged: (value) {
                controller.acceptTermsAndConditions.value = value!;
              },
            ),
          ),
        ),
        //   controller.acceptTerms.value = value!;
        // },
        const SizedBox(
          width: Sizes.spaceBtwItems / 2,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '${STexts.iAgreeTo} ',
              style: Theme.of(context).textTheme.labelMedium),
          TextSpan(
              text: STexts.privacyPolicy,
              style: Theme.of(context).textTheme.labelMedium!.apply(
                  color: SColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: SColors.primary)),
          TextSpan(
              text: ' ${STexts.and} ',
              style: Theme.of(context).textTheme.labelMedium),
          TextSpan(
              text: STexts.termsOfUse,
              style: Theme.of(context).textTheme.labelMedium!.apply(
                  color: SColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: SColors.primary)),
        ])),
      ],
    );
  }
}
