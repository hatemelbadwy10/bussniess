import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:business_app/app_routing/route_names.dart';
import 'package:business_app/core/services/navigation_service.dart';
import 'package:business_app/core/services/service_locator.dart';
import 'package:meta/meta.dart';

import '../../../../core/services/shared_prefs_service.dart';
import '../../../../core/utils/storage_keys.dart';
import '../../../../core/utils/widgets/message_handlers.dart';
import '../../domain/login_repo/login_repo.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._loginRepo) : super(LoginInitial()) {
    on<Login>(_login);
    on<VerifyEvent>(_verifyLogin);
    on<ForgetPasswordEvent>(_forgetPassword);
  }

  final LoginRepo _loginRepo;

  _login(Login event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final result = await _loginRepo.login(event.email, event.password);
    result.fold((l) {
      emit(LoginFailure(l.message));
    }, (r) {
      getIt<NavigationService>().navigateTo(RouteNames.verifyLoginScreen);
      emit(LoginSuccess(r));
      log('we are here from success');
    });
  }

  _verifyLogin(VerifyEvent event, Emitter<LoginState> emit) async {
    emit(VerifyLoading());
    final result = await _loginRepo.verifyLogin(event.otp);
    result.fold((l) {
      emit(VerifyFailure(errMessage: l.message));
    }, (r) {
      emit(VerifySuccess());
      var (message, userData) = r;
      ShowToastMessages.showMessage(message);
      log('token from verify ${userData.data!.accessToken!}');

      log('user email ${userData.data!.user?.email}');
      log('user ${userData.data!.user?.fullName}');
      getIt<SharedPrefServices>().saveBoolean(StorageKeys.isLoggedIn, true);
      getIt<SharedPrefServices>()
          .saveString(StorageKeys.token, userData.data!.accessToken!);
      // getIt<SharedPrefServices>()
      //     .saveString(StorageKeys.userData, jsonEncode(userData.data!.user!));
      //getIt<NavigationService>().
    });
  }

  _forgetPassword(ForgetPasswordEvent event, Emitter<LoginState> emit) async {
    emit(ForgetLoading());
    final result = await _loginRepo.forgetPassword(event.email);
    result.fold((l) {
      emit(ForgetFailure());
      getIt<NavigationService>().navigateTo(RouteNames.resetPassword,
          arguments: {"email": event.email});
    }, (r) {
      emit(ForgetSuccess());
    });
  }
  _resetPassword(ResetPasswordEvent event,Emitter<LoginState>emit)async{
    emit(ResetLoading());
    final result = await _loginRepo.resetPassword(event.email, event.password, event.confirmPassword, event.confirmPassword);
    result.fold((l){
      emit(ResetFailure());
    }, (r){
      emit(ResetSuccess());
    });
  }

}
