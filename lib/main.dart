import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';
import 'package:bhagwatiassociate/app.dart';

/// -- Entru point of the app
Future<void> main() async {
  /// widget binding
  final WidgetsBinding widgetBinding =
      WidgetsFlutterBinding.ensureInitialized();

  /// -- Getx local storage
  await GetStorage.init();

  /// -- await splash until items loaded
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);

  /// -- put auth reository
  // Get.put(AuthRepository());
  /// -- run the app
  runApp(const MyApp());
}
