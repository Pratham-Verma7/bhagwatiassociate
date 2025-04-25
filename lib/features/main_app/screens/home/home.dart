import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bhagwatiassociate/coman/container/primary_header_container.dart';
import 'package:bhagwatiassociate/features/main_app/screens/home/widgets/action_button.dart';
import 'package:bhagwatiassociate/features/main_app/screens/home/widgets/home_appbar.dart';
import 'package:bhagwatiassociate/utils/constants/colors.dart';
import 'package:bhagwatiassociate/utils/constants/sizes.dart';

import '../../controllers/home_controller.dart';
import 'widgets/total_stats.dart';
import 'widgets/upcoming_appointments.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      // appBar: const SHomeAppbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SPrimaryHeaderContainer(
                bgcolor: SColors.primary,
                child: Column(
                  children: [
                    const SHomeAppbar(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.defaultSpace),
                      child: Column(
                        children: [
                          const SizedBox(height: Sizes.spaceBtwItems),
                          TotalStats(controller: controller),
                          const SizedBox(height: Sizes.spaceBtwSections),
                        ],
                      ),
                    ),
                  ],
                )),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.defaultSpace),
              child: Column(
                children: [
                  ActionButton(),
                  SizedBox(height: 16),
                  UpcomingAppointments(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
