import 'package:flutter/material.dart';

import 'app_routing/app_router.dart';
import 'app_routing/route_names.dart';
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.loginScreen,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
