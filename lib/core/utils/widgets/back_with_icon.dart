
import 'package:flutter/material.dart';

import '../../../app_routing/route_names.dart';
import '../../services/navigation_service.dart';
import '../../services/service_locator.dart';
import '../app_colors.dart';
import '../styles.dart';

class BackWithIconBG extends StatelessWidget {
  const BackWithIconBG({
    required this.iconData,
    this.allowBack = true,
    required this.title,
    this.isHome = false,
    this.isFromNotification = false, // New parameter to check if from notification
    super.key,
  });

  final IconData iconData;
  final String title;
  final bool allowBack;
  final bool isHome;
  final bool isFromNotification; // Flag to indicate if navigated from a notification

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (allowBack) {
          if (isFromNotification || isHome) {
            getIt<NavigationService>().navigateToAndReplace(RouteNames.homeView);
          } else {
            getIt<NavigationService>().goBack();
          }
        }
      },
      child: SizedBox(
        height: 70,
        child: Stack(
          children: [
            Positioned(
              left: -10,
              child: Icon(
                iconData,
                size: 70,
                color: Colors.grey.shade300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22, left: 13),
              child: Row(
                children: [
                  if (allowBack)
                    Icon(
                      isFromNotification ? Icons.close : Icons.arrow_back, // Show "X" if from notification
                      color: AppColors.darkBG,
                    ),
                  const SizedBox(width: 5),
                  Text(
                    title,
                    style: Styles.text22Bold.copyWith(
                      color: AppColors.darkBG,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
