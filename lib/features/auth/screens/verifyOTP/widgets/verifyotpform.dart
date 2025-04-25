import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:bhagwatiassociate/features/auth/controllers/verifyotp_controller/verifyotpcontroller.dart';
import 'package:bhagwatiassociate/utils/constants/colors.dart';
import 'package:bhagwatiassociate/utils/constants/sizes.dart';
import 'package:bhagwatiassociate/utils/constants/text_str.dart';
import 'package:bhagwatiassociate/utils/device/device_utility.dart';
import 'package:bhagwatiassociate/utils/formatters/formatter.dart';
import 'package:bhagwatiassociate/utils/helpers/helper_functions.dart';

class Verifyotpform extends StatelessWidget {
  const Verifyotpform({super.key});

  @override
  Widget build(BuildContext context) {
    final VerifyOtpController controller = Get.put(VerifyOtpController());

    final pinwidth =
        ((SDeviceUtils.getScreenWidth(context) - ((Sizes.defaultSpace) * 2)) -
                (Sizes.spaceBtwInputFields) * 5) /
            6;
    return Form(
        child: Column(children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(SFormatter.otpSent(controller.registrationData.mobileNumber),
              overflow: TextOverflow.visible,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: SColors.darkGrey,
                  )),
        ],
      ),
      const SizedBox(
        height: Sizes.spaceBtwInputFields,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          otpTextFormField(
            pinwidth: pinwidth,
            controller: controller.pin1Controller,
            onchanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            onsaved: (pin1) {},
            autoFocus: true,
          ),
          otpTextFormField(
            pinwidth: pinwidth,
            controller: controller.pin2Controller,
            onchanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              } else if (value.isEmpty) {
                FocusScope.of(context).previousFocus();
              }
            },
            onsaved: (pin2) {},
          ),
          otpTextFormField(
            pinwidth: pinwidth,
            controller: controller.pin3Controller,
            onchanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              } else if (value.isEmpty) {
                FocusScope.of(context).previousFocus();
              }
            },
            onsaved: (pin3) {},
          ),
          otpTextFormField(
            pinwidth: pinwidth,
            controller: controller.pin4Controller,
            onchanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              } else if (value.isEmpty) {
                FocusScope.of(context).previousFocus();
              }
            },
            onsaved: (pin4) {},
          ),
          otpTextFormField(
            pinwidth: pinwidth,
            controller: controller.pin5Controller,
            onchanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              } else if (value.isEmpty) {
                FocusScope.of(context).previousFocus();
              }
            },
            onsaved: (pin5) {},
          ),
          otpTextFormField(
            pinwidth: pinwidth,
            controller: controller.pin6Controller,
            onchanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).unfocus();
              } else if (value.isEmpty) {
                FocusScope.of(context).previousFocus();
              }
            },
            onsaved: (pin6) {},
          ),
        ],
      ),
      const SizedBox(
        height: Sizes.spaceBtwInputFields,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () => controller.resendOtp(),
              child: Text("Resend OTP",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: SColors.primary,
                      ))),
          TextButton(
              onPressed: () => Get.back(),
              child: Text("Change Number",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: SColors.primary,
                      ))),
        ],
      ),
      const SizedBox(
        height: Sizes.spaceBtwInputFields,
      ),
      Obx(() => SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: controller.remainingTime.value > 0
                  ? () => controller.sendVerifyOtpRequest()
                  : () => SHelperFunctions.showSnackBar(
                      "Your OTP expired"), // Disable button when remainingTime is 0
              child: const Text(STexts.verifyButton)))),
      const SizedBox(
        height: Sizes.spaceBtwInputFields,
      ),
      Obx(() => Text(
            'Code will expire in ${controller.remainingTime.value} seconds',
            style: Theme.of(context).textTheme.labelMedium,
          )),
    ]));
  }
}

class otpTextFormField extends StatelessWidget {
  const otpTextFormField({
    super.key,
    required this.pinwidth,
    required this.controller,
    this.onsaved,
    this.onchanged,
    this.autoFocus = false,
  });

  final double pinwidth;
  final TextEditingController controller;
  final onsaved;
  final onchanged;
  final bool autoFocus;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: pinwidth + 4,
      width: pinwidth,
      child: TextFormField(
        controller: controller,
        onSaved: onsaved,
        onChanged: onchanged,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
            filled: true,
            fillColor: SColors.primary.withOpacity(0.1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                width: 1,
                color: SColors.primary,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                width: 1,
                color: SColors.primary,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                width: 1,
                color: SColors.primary,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.red,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                width: 2,
                color: Colors.orange,
              ),
            ),
            hintText: "0",
            hintStyle: TextStyle(
                color: SColors.grey,
                fontSize:
                    Theme.of(context).textTheme.headlineMedium!.fontSize)),
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        autofocus: autoFocus,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        onTap: () {
          controller.selection = TextSelection.fromPosition(
            TextPosition(offset: controller.text.length),
          );
        },
        onFieldSubmitted: (value) {
          if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }
}
