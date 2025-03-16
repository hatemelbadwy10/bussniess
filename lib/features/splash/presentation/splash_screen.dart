import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../app_routing/route_names.dart';
import '../../../core/services/navigation_service.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/services/shared_prefs_service.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets.dart';
import '../../../core/utils/storage_keys.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  late final bool loggedIn;
  @override
  void initState() {
    super.initState();
    _checkifLoggedIn();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.darkBG,
        systemNavigationBarColor: AppColors.darkBG,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0,
      end: 2.5,
    ).animate(
      CurvedAnimation(
        parent: _scaleController,
        curve: Curves.easeInOutBack,
      ),
    );
    Future.delayed(
      const Duration(seconds: 2),
      () => _scaleController.forward(),
    );
    _scaleController.addListener(() {
      if (_scaleController.isCompleted) {
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarColor: AppColors.whiteBG,
            statusBarIconBrightness: Brightness.dark,
          ),
        );
        final route = loggedIn ? RouteNames.homeView : RouteNames.loginScreen;
        getIt<NavigationService>().navigateToAndClearStack(route);
      }
    });
  }

  _checkifLoggedIn() async {
    loggedIn =
        await getIt<SharedPrefServices>().getBoolean(StorageKeys.isLoggedIn);
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBG,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 100,
            alignment: Alignment.center,
            child: Image.asset(Assets.whiteLogo),
          ),
          Center(
            child: ScaleTransition(
              scale: _scaleAnimation,
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.sizeOf(context).longestSide,
                height: MediaQuery.sizeOf(context).longestSide,
                decoration: const BoxDecoration(
                  color: AppColors.whiteBG,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
