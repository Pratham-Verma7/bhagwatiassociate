import 'package:flutter/material.dart';
import 'package:bhagwatiassociate/coman/widgets/appbar/appbar.dart';
import 'package:bhagwatiassociate/features/auth/screens/login/widgets/loginform.dart';
import 'package:bhagwatiassociate/features/auth/screens/login/widgets/loginheader.dart';
import 'package:bhagwatiassociate/features/auth/screens/login/widgets/registerbutton.dart';
import 'package:bhagwatiassociate/utils/constants/sizes.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.defaultSpace),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  SAppBar(
                    appBarPadding: false,
                    title: Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    centertitle: true,
                  ),
                  // SizedBox(height: SDeviceUtils.getScreenWidth(context) / 2),
                  LoginHeader(),
                ],
              ),

              SizedBox(height: Sizes.spaceBtwItems),
              SLoginForm(),
              SizedBox(
                height: Sizes.spaceBtwSections,
              ),
              // no account
              // RegisterTile(),
            ],
          ),
        ),
      ),
    );
  }
}
