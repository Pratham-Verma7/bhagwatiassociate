import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:bhagwatiassociate/coman/texts/section_heading.dart';
import 'package:bhagwatiassociate/coman/widgets/appbar/appbar.dart';
import 'package:bhagwatiassociate/data/repositories/authentication_repo/authentication_repository.dart';
import 'package:bhagwatiassociate/features/personalization/controllers/user_controller.dart';
import 'package:bhagwatiassociate/features/personalization/model/user_model.dart';
import 'package:bhagwatiassociate/utils/constants/colors.dart';
import 'package:bhagwatiassociate/utils/constants/sizes.dart';
import 'package:bhagwatiassociate/utils/device/device_utility.dart';
import 'package:bhagwatiassociate/utils/helpers/helper_functions.dart';

class settings extends StatelessWidget {
  const settings({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ConsultantUserController>();

    return Scaffold(
        appBar: SAppBar(
          centertitle: true,
          title: Text(
            'Settings',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          showBackArrow: false,
          // appBarPadding: false,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Iconsax.search_normal_1,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  // height: Sizes.spaceBtwSections*3,
                  padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.defaultSpace / 2),
                  width: SDeviceUtils.getScreenWidth(context),
                  color: SColors.lightGrey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: Sizes.spaceBtwSections * 2,
                      ),
                      Obx(() {
                        return Text(
                            SHelperFunctions.capitalize(
                                "Hello ${SHelperFunctions.capitalize(ConsultantUserDataModel.nameParts(controller.user.value.fullName)[0])}!"),
                            style: Theme.of(context).textTheme.headlineMedium);
                      }),
                      const SizedBox(
                        height: Sizes.spaceBtwSections,
                      )
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(Sizes.defaultSpace),
                child: Column(
                  children: [
                    // const BSettingMenuTile(
                    //     title: 'My College',
                    //     icon: Iconsax.building,
                    //     subTitle: 'Galgotias College of Engineering and Technology'),
                    // const SizedBox(height: Sizes.spaceBtwSections),
                    // user profile card
                    // const SUserProfileTile(),

                    SettingsListTile(
                      title: "My Schedule",
                      leadingIcon: (Iconsax.calendar),
                      actions: [
                        IconButton(
                          icon: const Icon(Iconsax.arrow_right_1),
                          onPressed: () {
                            // Handle forward button press
                          },
                        ),
                      ],
                    ),
                    SettingsListTile(
                      title: "Edit Profile",
                      leadingIcon: (Iconsax.profile_2user),
                      actions: [
                        IconButton(
                          icon: const Icon(Iconsax.arrow_right_1),
                          onPressed: () {
                            // Handle forward button press
                          },
                        ),
                      ],
                    ),
                    SettingsListTile(
                      title: "Edit Password",
                      leadingIcon: (Iconsax.profile_2user),
                      actions: [
                        IconButton(
                          icon: const Icon(Iconsax.arrow_right_1),
                          onPressed: () {
                            // Handle forward button press
                          },
                        ),
                      ],
                    ),
                    SettingsListTile(
                      title: "Logout",
                      leadingIcon: (Iconsax.logout),
                      actions: [
                        IconButton(
                            icon: const Icon(Iconsax.arrow_right_1),
                            onPressed: AuthRepository.instance.signOut),
                      ],
                    ),
                    SettingsListTile(
                      title: "Delete Account",
                      leadingIcon: (Iconsax.profile_delete),
                      actions: [
                        IconButton(
                            icon: const Icon(
                              Iconsax.arrow_right_1,
                              color: SColors.warning,
                            ),
                            onPressed: AuthRepository.instance.deleteAccount),
                      ],
                    ),
                    const SizedBox(
                      height: Sizes.spaceBtwSections,
                    ),
                    const BSectionHeading(
                      title: 'Language',
                    ),
                    const SizedBox(
                      height: Sizes.spaceBtwItems / 2,
                    ),
                    SettingsListTile(
                      title: "Switch Language",
                      leadingIcon: (Iconsax.profile_2user),
                      actions: [
                        Text(
                          "ENGLISH  ",
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),

                    const SizedBox(
                      height: Sizes.spaceBtwSections,
                    ),
                    const BSectionHeading(
                      title: 'Help & FAQ',
                    ),
                    const SizedBox(
                      height: Sizes.spaceBtwItems / 2,
                    ),

                    SettingsListTile(
                      title: "FAQ's",
                      leadingIcon: (Iconsax.info_circle),
                      actions: [
                        IconButton(
                          icon: const Icon(Iconsax.arrow_right_1),
                          onPressed: () {
                            // Handle forward button press
                          },
                        ),
                      ],
                    ),
                    SettingsListTile(
                      title: "Terms & Conditions",
                      leadingIcon: (Iconsax.document),
                      actions: [
                        IconButton(
                          icon: const Icon(Iconsax.arrow_right_1),
                          onPressed: () {
                            // Handle forward button press
                          },
                        ),
                      ],
                    ),
                    SettingsListTile(
                      title: "Privacy Policies",
                      leadingIcon: (Iconsax.lock_1),
                      actions: [
                        IconButton(
                          icon: const Icon(Iconsax.arrow_right_1),
                          onPressed: () {
                            // Handle forward button press
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: Sizes.spaceBtwSections,
                    ),
                    const BSectionHeading(
                      title: 'General',
                    ),
                    const SizedBox(
                      height: Sizes.spaceBtwItems / 2,
                    ),
                    SettingsListTile(
                      title: "Design and Build",
                      leadingIcon: (Iconsax.cup),
                      actions: [
                        Text(
                          "LIPSUM  ",
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),
                    SettingsListTile(
                      title: "App Version",
                      leadingIcon: (Iconsax.information4),
                      actions: [
                        Text(
                          "0.0.1(DEV)  ",
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),
                    SettingsListTile(
                      title: "OS Version",
                      leadingIcon: (Iconsax.archive_minus),
                      actions: [
                        Text(
                          "Android 14  ",
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: Sizes.spaceBtwSections * 2,
                    ),
                    // SizedBox(
                    //     width: double.infinity,
                    //     child: ElevatedButton(
                    //         onPressed: () => AuthRepository.instance.signOut(),
                    //         child: const Text('Logout'))),
                    // const SizedBox(
                    //   height: Sizes.spaceBtwItems,
                    // ),
                    // SizedBox(
                    //     width: double.infinity,
                    //     child: OutlinedButton(
                    //         onPressed: () =>
                    //             AuthRepository.instance.deleteAccount(),
                    //         child: const Text('Delete Account',
                    //             style: TextStyle(color: Colors.red)))),
                    Text(
                      "Build with Love and Harkwork",
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: SColors.primary.withOpacity(0.4),
                          ),
                    ),
                    const SizedBox(
                      height: Sizes.spaceBtwSections,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({
    super.key,
    this.leadingIcon,
    required this.title,
    this.actions,
  });

  final String title;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: Icon(
            leadingIcon,
            color: SColors.black,
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: actions ?? [],
            // [
            //     actions
            // const Text("Custom Text"),
            // IconButton(
            //   icon: const Icon(Icons.settings),
            //   onPressed: () {
            //     // Handle settings button press
            //   },
            // ),

            // ],
          ),
        ),
        const Divider(
          color: SColors.lightGrey, // Light grey color for the line
          thickness: 1, // Thickness of the line
          height: 1, // No extra height, just the line itself
        ),
      ],
    );
  }
}
