import 'package:business_app/core/services/shared_prefs_service.dart';
import 'package:business_app/features/auth/data/login_data_source.dart';
import 'package:business_app/features/auth/data/login_repo_impl.dart';
import 'package:business_app/features/auth/domain/login_repo.dart';
import 'package:business_app/features/auth/presentation/controller/login_bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';

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
  getIt.registerLazySingleton<LoginRepository>(()=>LoginRepoImpl(getIt()));
  getIt.registerFactory(()=>LoginBloc(getIt()));
}