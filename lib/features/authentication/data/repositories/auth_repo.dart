import 'dart:developer';
import 'package:bookia_app/core/services/apis/apis.dart';
import 'package:bookia_app/core/services/apis/dio_provider.dart';
import 'package:bookia_app/features/authentication/data/models/auth_params.dart';
import 'package:bookia_app/features/authentication/data/models/auth_response/auth_response.dart';
import 'package:dio/dio.dart';

class AuthRepo {
  static Future<AuthResponse?> loginRepo(AuthParams params) async {
    try {
      log("--------1---------");
      final response = await DioProvider.post(
        // البادي بتاع الريكويست
        endpoint: APIs.loginEndpoint,
        data: params.toJson(),
      );
      // البادي بتاع الريسبونس
      log("--------2---------");
      if (response.statusCode == 200) {
        // Handle successful registration
        final data = AuthResponse.fromJson(response.data);
        return data;
      } else {
        // Handle registration error
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> registerRepo(AuthParams params) async {
    try {
      log("Request Body: ${params.toJson()}");
      final response = await DioProvider.post(
        endpoint: APIs.registerEndpoint,
        data: params.toJson(),
      );

      if (response.statusCode == 201) {
        return AuthResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on DioException catch (e) {
      log("Status Code: ${e.response?.statusCode}");
      log("Response: ${e.response?.data}");
      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
