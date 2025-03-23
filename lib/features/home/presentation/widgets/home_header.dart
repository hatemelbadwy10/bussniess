
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../app_routing/route_names.dart';
import '../../../../core/services/navigation_service.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/assets.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 80,
          alignment: Alignment.center,
          child: Image.asset(Assets.header),
        ),
        const Spacer(),
        // Stack(
        //   children: [
        //     IconButton(
        //       onPressed: () {},
        //       icon: const Icon(
        //         FontAwesomeIcons.solidBell,
        //         color: Colors.grey,
        //       ),
        //     ),
        //     Positioned(
        //       right: 15,
        //       top: 15,
        //       child: IgnorePointer(
        //         child: Container(
        //           decoration: const BoxDecoration(
        //             shape: BoxShape.circle,
        //             color: Color(0xFFD02670),
        //           ),
        //           width: 8,
        //           height: 8,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        IconButton(
          onPressed: () {
            getIt<NavigationService>().navigateTo(RouteNames.settingsView);
          },
          icon: const Icon(
            FontAwesomeIcons.gear,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
