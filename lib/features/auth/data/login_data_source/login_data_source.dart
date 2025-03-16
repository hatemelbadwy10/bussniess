import 'dart:developer';

import 'package:business_app/core/network/api_constants.dart';
import 'package:business_app/core/network/network_provider/api_services.dart';
import 'package:business_app/features/auth/data/model/user_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/exception/server_exception.dart';

abstract class LoginDataSource {
  Future<Either<String,String>>login(
      String email,String password
      );
  Future<(String message ,UserModel)>verifyLogin(String otp);
  Future forgetPassword(String email);
  Future resetPassword(
      String email, String password, String confirmPassword, String pinCode);
}

class LoginDataSourceImpl extends LoginDataSource {
  final ApiService _apiService;

  LoginDataSourceImpl(this._apiService);

  @override
  Future<Either<String, String>> login(String email, String password) async {
    final response = await _apiService.post(ApiConstants.login, body: {
      "email": email,
      "password": password
    });

    return response.fold(
          (l) => Left(l.message), // Return failure message
          (r) => Right(r.data['data']['otp'].toString()), // Return OTP
    );
  }

  @override
  Future<(String, UserModel)> verifyLogin(String otp) async {
    final response = await _apiService.post(ApiConstants.verify, body: {
      "otp": otp,
      "id":1
    });

  return  response.fold(
          (l) {
        throw ServerException(errorModel: l);
      },
          (r) {
        var userData = UserModel.fromJson(r.data);
        return (r.message.toString(), userData);
      },
    );

  }
  Future<String> forgetPassword(String email) async {
    final response = await _apiService.post(
      ApiConstants.forgetPassword,
      body: {
        "email": email,
      },
    );

    return response.fold((l) {
      throw ServerException(errorModel: l);
    }, (r) {
      log('Response data: ${r.data}');
      final message = r.data['message'] as String;
      return message; // Explicitly return the message
    });
  }
  @override
  Future resetPassword(String email, String password, String confirmPassword,
      String pinCode) async {
    final response = await _apiService.post(ApiConstants.resetPassword, body: {
      'pin_code': pinCode,
      'password': password,
      "password_confirmation": confirmPassword,
      "email": email
    });
    response.fold((l) {
      throw ServerException(errorModel: l);
    }, (r) {
      log('r ${r.data['message']}');
      final message = r.data['message'];
      log('message $message');
      return message;
    });
  }

}
