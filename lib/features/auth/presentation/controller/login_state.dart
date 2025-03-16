part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final String otp;

  LoginSuccess(this.otp);
}
final class LoginFailure extends LoginState {
  final String errorMessage;

  LoginFailure(this.errorMessage);
}
final class VerifyLoading extends LoginState{}
final class VerifySuccess extends LoginState{}
final class VerifyFailure extends LoginState{
  final String errMessage;

  VerifyFailure({required this.errMessage});
}
final class ForgetLoading extends LoginState{}
final class ForgetSuccess extends LoginState{}
final class ForgetFailure extends LoginState{}
final class ResetSuccess extends LoginState{}
final class ResetLoading extends LoginState{}
final class ResetFailure extends LoginState{}