import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:bhagwatiassociate/bindings/general_bindings.dart';
import 'package:bhagwatiassociate/utils/constants/colors.dart';
import 'package:bhagwatiassociate/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      // show leader meanwhile auth repo is deciding to show screen.
      home: const Scaffold(
        backgroundColor: SColors.primarybg,
        body: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
