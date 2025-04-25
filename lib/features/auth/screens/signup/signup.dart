import 'package:flutter/material.dart';
import 'package:bhagwatiassociate/coman/widgets/appbar/appbar.dart';
import 'package:bhagwatiassociate/features/auth/screens/signup/widgets/provider_register_form.dart';
import 'package:bhagwatiassociate/utils/constants/sizes.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SAppBar(
        title: Text(
          'Signup',
          style: TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
        showBackArrow: true,
        centertitle: true,
        appBarPadding: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              // form
              SizedBox(
                height: Sizes.spaceBtwSections,
              ),
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}
