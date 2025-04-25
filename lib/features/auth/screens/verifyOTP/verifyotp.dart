import 'package:flutter/material.dart';
import 'package:bhagwatiassociate/coman/widgets/appbar/appbar.dart';
import 'package:bhagwatiassociate/features/auth/screens/verifyOTP/widgets/verifyotpform.dart';
import 'package:bhagwatiassociate/utils/constants/colors.dart';
import 'package:bhagwatiassociate/utils/constants/sizes.dart';
import 'package:bhagwatiassociate/utils/constants/text_str.dart';
import 'package:bhagwatiassociate/utils/device/device_utility.dart';

class VerifyOtp extends StatelessWidget {
  const VerifyOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: SColors.lightGrey,
        body: Stack(
          children: [
            Positioned(
              child: Container(
                height: SDeviceUtils.getScreenWidth(context) / 2 + 50,
                width: double.infinity,
                color: SColors.primary,
              ),
            ),
            const Positioned(
              child: SAppBar(
                title: Text(
                  STexts.verifyTitle,
                  style: TextStyle(color: SColors.white),
                ),
                showBackArrow: true,
                centertitle: true,
                appBarPadding: false,
                // bgcolor: SColors.primary,
              ),
            ),
            Positioned(
              top: SDeviceUtils.getScreenWidth(context) / 2 - 50,
              left: 0,
              child: Padding(
                padding: (const EdgeInsets.symmetric(horizontal: Sizes.m)),
                child: Container(
                  width: SDeviceUtils.getScreenWidth(context) - (Sizes.m * 2),
                  height: MediaQuery.of(context).size.height -
                      (SDeviceUtils.getScreenWidth(context) / 2 -
                          50), // Set height to occupy space till bottom

                  decoration: const BoxDecoration(
                    color: SColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Sizes.borderRadiusMd),
                      topRight: Radius.circular(Sizes.borderRadiusMd),
                    ),
                  ),
                  // padding: const EdgeInsets.,
                  child: Padding(
                    padding: const EdgeInsets.all(Sizes.m),
                    child: Column(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: Sizes.spaceBtwSections,
                          ),
                          Text(
                            STexts.verifyHeading,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                  color: SColors.black,
                                  // fontSize: Sizes.fontSizeLg,
                                ),
                          ),
                          const SizedBox(
                            height: Sizes.spaceBtwItems,
                          ),
                          Text(
                            STexts.verifyDesc,
                            overflow: TextOverflow.visible,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: SColors.dark,
                                    ),
                          ),
                          const SizedBox(
                            height: Sizes.spaceBtwSections,
                          ),
                          const Verifyotpform(),
                        ],
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
