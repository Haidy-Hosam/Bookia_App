import 'dart:developer';
import 'package:bookia_app/Core/Services/apis/apis.dart';
import 'package:bookia_app/Core/Services/apis/dio_provider.dart';
import 'package:bookia_app/Features/authentication/data/models/auth_params.dart';
import 'package:bookia_app/Features/authentication/data/models/auth_response/auth_response.dart';

class AuthRepo {
  static Future<AuthResponse?> loginRepo(AuthParams params) async {
    try {
      DioProvider.post(
        // البادي بتاع الريكويست
        endpoint: APIs.loginEndpoint,
        data: params.toJson(),
      ).then((response) {
        // البادي بتاع الريسبونس
        if (response.statusCode == 200) {
          // Handle successful registration
          var data = AuthResponse.fromJson(response.data);
          return data;
        } else {
          // Handle registration error
          return null;
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> registerRepo(AuthParams params) async {
    try {
      DioProvider.post(
        // البادي بتاع الريكويست
        endpoint: APIs.registerEndpoint,
        data: params.toJson(),
      ).then((response) {
        // البادي بتاع الريسبونس
        if (response.statusCode == 201) {
          // Handle successful registration
          var data = AuthResponse.fromJson(response.data);
          return data;
        } else {
          // Handle registration error
          return null;
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
