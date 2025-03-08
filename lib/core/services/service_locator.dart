import 'package:business_app/core/services/shared_prefs_service.dart';
import 'package:get_it/get_it.dart';

import 'navigation_service.dart';

GetIt getIt = GetIt.instance;
setupSingeltonServices() async {
  getIt.registerLazySingleton(() => NavigationService());
  getIt.registerLazySingleton(() => SharedPrefServices());
  await getIt<SharedPrefServices>().init();

}