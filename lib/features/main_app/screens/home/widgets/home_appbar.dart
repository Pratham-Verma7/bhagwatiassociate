import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:bhagwatiassociate/coman/widgets/appbar/appbar.dart';
import 'package:bhagwatiassociate/features/personalization/controllers/user_controller.dart';
import 'package:bhagwatiassociate/features/personalization/model/user_model.dart';
import 'package:bhagwatiassociate/utils/constants/colors.dart';
import 'package:bhagwatiassociate/utils/constants/text_str.dart';
import 'package:bhagwatiassociate/utils/helpers/helper_functions.dart';

class SHomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const SHomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ConsultantUserController());
    return SAppBar(
      centertitle: false,
      appBarPadding: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() {
            return Text(
                SHelperFunctions.capitalize(ConsultantUserDataModel.nameParts(
                    controller.user.value.fullName)[0]),
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: Colors.white));
          }),
          Text(STexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: Colors.white.withOpacity(0.75))),
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.notification_bing,
              color: SColors.white,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
