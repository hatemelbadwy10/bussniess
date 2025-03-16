part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}
class Login extends LoginEvent{
 final String email,password;

  Login(this.email, this.password);
}
class VerifyEvent extends LoginEvent{
 final String otp;

  VerifyEvent({required this.otp});
}
class ForgetPasswordEvent extends LoginEvent{
 final String email;

  ForgetPasswordEvent({required this.email});
}
class ResetPasswordEvent extends LoginEvent{
 final String email, password,confirmPassword,pinCode;

  ResetPasswordEvent(this.password, this.confirmPassword, this.pinCode, {required this.email});
}