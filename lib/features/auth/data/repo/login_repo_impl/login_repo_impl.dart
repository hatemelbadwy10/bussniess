import 'dart:developer';

import 'package:business_app/core/network/models/api_error_model.dart';
import 'package:business_app/features/auth/data/login_data_source/login_data_source.dart';
import 'package:business_app/features/auth/data/model/user_model.dart';
import 'package:business_app/features/auth/domain/login_repo/login_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/network/exception/server_exception.dart';

class LoginRepoImpl extends LoginRepo {
  final LoginDataSource _dataSource;

  LoginRepoImpl(this._dataSource);

  @override
  Future<Either<ApiFaliureModel, String>> login(String email, String password) async {
    try {
      final result = await _dataSource.login(email, password);
log('result $result');
     return Right(result.toString());
    } on ServerException catch (failure) {
      return Left(failure.errorModel); // Handle ServerException
    }
  }

  @override
  Future<Either<ApiFaliureModel, (String, UserModel)>> verifyLogin(String otp)async {
  try{
    final result = await _dataSource.verifyLogin(otp);
    return Right(result);
  }on ServerException catch (faliure) {
    return Left(faliure.errorModel);
  }
  }
  @override
  Future<Either<ApiFaliureModel, String>> forgetPassword(String email) async {
    try {
      final result = await _dataSource.forgetPassword(email);

      return Right(result);
    } on ServerException catch (failure) {
      return Left(failure.errorModel);
    }
  }
  @override
  Future<Either<ApiFaliureModel, String>> resetPassword(String email,
      String password, String passwordConfirm, String pinCode) async {
    try {
      final result = await _dataSource.resetPassword(
          email, password, passwordConfirm, pinCode);
      log('result $result');
      return Right(result??'Your password reset correct');
    } on ServerException catch (failure) {
      return Left(failure.errorModel);
    }
  }
}
