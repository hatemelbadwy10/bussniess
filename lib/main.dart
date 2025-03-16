import 'package:flutter/material.dart';

import 'app_routing/app_router.dart';
import 'app_routing/route_names.dart';
import 'core/services/navigation_service.dart';
import 'core/services/service_locator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setupSingeltonServices();
  runApp(const ExBusiness());
}

class ExBusiness extends StatelessWidget {
  const ExBusiness({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.splashScreen,
      onGenerateRoute: AppRouter.generateRoute,
      navigatorKey: getIt<NavigationService>().navigatorKey,
    );
  }
}
