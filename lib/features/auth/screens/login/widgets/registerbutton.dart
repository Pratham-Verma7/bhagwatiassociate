import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bhagwatiassociate/features/auth/screens/signup/signup.dart';
import 'package:bhagwatiassociate/utils/constants/colors.dart';
import 'package:bhagwatiassociate/utils/constants/text_str.dart';

class RegisterTile extends StatelessWidget {
  const RegisterTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('${STexts.noAcc} '),
        TextButton(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(SColors.primary),
          ),
          onPressed: () => Get.to(const SignupScreen()),
          child: const Text(
            STexts.register,
          ),
        ),
      ],
    );
  }
}
