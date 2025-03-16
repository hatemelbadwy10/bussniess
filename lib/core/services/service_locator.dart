import 'package:business_app/core/services/shared_prefs_service.dart';
import 'package:business_app/features/auth/domain/login_repo/login_repo.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/login_data_source/login_data_source.dart';
import '../../features/auth/data/repo/login_repo_impl/login_repo_impl.dart';
import '../../features/auth/presentation/controller/login_bloc.dart';
import '../network/network_provider/api_services.dart';
import '../network/network_provider/dio_api_service_impl.dart';
import 'navigation_service.dart';

GetIt getIt = GetIt.instance;
setupSingeltonServices() async {
  getIt.registerLazySingleton(() => NavigationService());
  getIt.registerLazySingleton(() => SharedPrefServices());
  getIt.registerLazySingleton<ApiService>(() => DioApiServiceImpl());
  _login();
  await getIt<SharedPrefServices>().init();

}
_login(){
  getIt.registerLazySingleton<LoginDataSource>(()=>LoginDataSourceImpl(getIt()));
  getIt.registerLazySingleton<LoginRepo>(()=>LoginRepoImpl(getIt()));
  getIt.registerFactory(()=>LoginBloc(getIt()));
}