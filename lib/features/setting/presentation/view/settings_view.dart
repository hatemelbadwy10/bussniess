import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/widgets/action_button.dart';
import '../../../../core/utils/widgets/back_with_icon.dart';
import '../widgets/section_tile.dart';
import '../widgets/tap_link.dart';
import '../widgets/tap_swither.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const BackWithIconBG(
              iconData: FontAwesomeIcons.gear,
              title: "Settings",
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SectionTitle("Security"),
                      const SizedBox(height: 15),
                      TapLink(
                        title: "Change Password",
                        onTap: () {
                          // getIt<NavigationService>().navigateTo(
                          //   RouteNames.changePasswordScreen,
                          //   arguments: {
                          //     "section_title": "Settings",
                          //     "sub_section_title": "Security",
                          //     "selected_service_title": "Change Password",
                          //   },
                          // );
                        },
                      ),
                      const Divider(color: AppColors.grey3),
                      TapLink(
                        title: "Change E-mail",
                        onTap: () {
                          // getIt<NavigationService>().navigateTo(
                          //   RouteNames.changeEmailScreen,
                          // );
                        },
                      ),
                      const Divider(color: AppColors.grey3),
                      TapLink(
                        title: "Change Mobile Number",
                        onTap: () {
                          // getIt<NavigationService>().navigateTo(
                          //   RouteNames.changeMobileNumberScreen,
                          // );
                        },
                      ),
                      const Divider(color: AppColors.grey3),
                      TapSwitcher(
                        title: "Face ID & Touch ID",
                        switcherDefaultValue: false,
                        onTap: (bool currentState) {
                          if (currentState) {
                            // LocalAuthService().authenticate();
                          }
                        },
                      ),
                      const Divider(color: AppColors.grey3),
                      TapSwitcher(
                        title: "Notifications",
                        switcherDefaultValue: false,
                        onTap: (bool currentState) {},
                      ),
                      const SizedBox(height: 15),
                      const SectionTitle("About Us"),
                      const SizedBox(height: 15),
                      TapLink(title: "Terms of Service", onTap: () {}),
                      const Divider(color: AppColors.grey3),
                      TapLink(title: "Privacy Policy", onTap: () {}),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ActionButton(
                    onPressed: () {
                    },
                    text: "Logout",
                    bgColor: AppColors.darkBG,
                    textColor: Colors.white,
                    borderRadius: 25,
                  )

              ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
