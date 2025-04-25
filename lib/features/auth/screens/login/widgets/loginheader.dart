import 'package:flutter/material.dart';
import 'package:bhagwatiassociate/utils/device/device_utility.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: SDeviceUtils.getScreenWidth(context) / 2.5,
        width: SDeviceUtils.getScreenWidth(context) / 2.5,
        child: const Image(
          image: AssetImage('assets/logo/ConsultPro.png'),
        ));
  }
}
