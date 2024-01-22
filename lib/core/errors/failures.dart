// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout With Api Service');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout With Api Service');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout With Api Service');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate With Api Service');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioException.response!.statusCode!, dioException.response!);
      case DioExceptionType.cancel:
        return ServerFailure('Request to Api Service was Canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection Error With Api Service');
      case DioExceptionType.unknown:
        {
          if (dioException.message!.contains('SocketException')) {
            return ServerFailure('Check your Internet Connection');
          }
          return ServerFailure('Unknown Error, Please try later');
        }

      default:
        return ServerFailure('Opps there was an error, Please try later');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error, Please try later');
    } else {
      return ServerFailure('Opps there was an error, Please try later');
    }
  }
}
