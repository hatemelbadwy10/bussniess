import 'package:business_app/features/auth/data/model/user_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/models/api_error_model.dart';

abstract class LoginRepo{
  Future<Either<ApiFaliureModel,String>>login(String email,String password);
  Future<Either<ApiFaliureModel,(String message,UserModel model)>>verifyLogin(String otp);
  Future<Either<ApiFaliureModel, String>> forgetPassword(String email);
  Future<Either<ApiFaliureModel, String>> resetPassword(
      String email,
      String password,
      String passwordConfirm,
      String pinCode,
      );
}