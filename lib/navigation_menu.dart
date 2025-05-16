// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:bhagwatiassociate/features/main_app/screens/home/home.dart';
// import 'package:bhagwatiassociate/features/personalization/screens/settings_screen/user_settings.dart';
// import 'package:bhagwatiassociate/utils/constants/colors.dart';
// import 'package:bhagwatiassociate/features/Dashboard/screens/dashboard_screen.dart';

// class NavigationController extends GetxController {
//   final Rx<int> selectedIndex = 0.obs;

//   final screens = [
//     // screens to navigate
//     const DashboardScreen(),
//     const Center(child: Text('Chat')),
//     const settings(),
//   ];
// }

// class NavigationMenu extends StatelessWidget {
//   const NavigationMenu({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<NavigationDestination> destinations = [
//       // screen navigation labels
//       const NavigationDestination(icon: Icon(Iconsax.home), label: 'Dashboard'),
//       const NavigationDestination(icon: Icon(Iconsax.message), label: 'Chat'),
//       const NavigationDestination(
//           icon: Icon(Iconsax.setting), label: 'Settings'),
//     ];

//     // dont change below code
//     final controller = Get.put(NavigationController());
//     const darkMode = false;

//     return Scaffold(
//       bottomNavigationBar: Obx(
//         () => NavigationBar(
//           height: 80,
//           elevation: 0,
//           selectedIndex: controller.selectedIndex.value,
//           onDestinationSelected: (Index) =>
//               controller.selectedIndex.value = Index,
//           backgroundColor: darkMode ? Colors.black : Colors.white,
//           indicatorColor: darkMode
//               ? SColors.white.withOpacity(0.1)
//               : SColors.primary.withOpacity(0.2),
//           destinations: destinations,
//         ),
//       ),
//       body: Obx(() => controller.screens[controller.selectedIndex.value]),
//     );
//   }
// }
