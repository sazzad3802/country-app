import 'dart:io';
import 'package:dio/dio.dart';

class DioError {
  static String getDioException(error, {bool isLogoutRequired = true}) {
    if (error is Exception) {
      try {
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
            case DioExceptionType.connectionTimeout:
              return "Cant connect to Server. Please check your Internet connectivity";
            case DioExceptionType.receiveTimeout:
            case DioExceptionType.sendTimeout:
              return "Something went wrong. Please try again";
            case DioExceptionType.badResponse:
              switch (error.response?.statusCode) {
                case 400:
                  return getError(error.response?.data) ??
                      "Something went wrong.Try again!";
                case 401:
                  if (isLogoutRequired) {
                    // logout();
                  }
                  return getError(error.response?.data) ??
                      "Email or password wrong.Try again.";
                case 403:
                  return getError(error.response?.data) ??
                      "Token expired. Login Again.";
                default:
                  var responseCode = error.response?.statusCode;
                  return getError(error.response?.data) ??
                      "Received invalid status code: $responseCode";
              }
            case DioExceptionType.unknown:
              return "Something went wrong. Please try again";
            case DioExceptionType.badCertificate:
              return "Something went wrong. Please try again";
            case DioExceptionType.connectionError:
              return "Something went wrong. Please try again";
          }
        } else if (error is SocketException) {
          return "Cant connect to Server. Please check your Internet connectivity";
        } else {
          return "Something went wrong. Please try again";
        }
      } on FormatException {
        return "Something went wrong. Please try again";
      } catch (_) {
        return "Something went wrong. Please try again";
      }
    } else {
      return "Something went wrong. Please try again";
    }
  }

  static getError(data) => data['message'] ?? data['error'];
}
