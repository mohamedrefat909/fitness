import 'package:fitness/core/models/error_data.dart';

class ServerError implements Exception {
  final ErrorModel? errorModel;  // قد يحتوي على تفاصيل الخطأ من الخادم

  ServerError(this.errorModel);

  String getErrorMessage() {
    return errorModel?.message ?? "An unexpected server error occurred";
  }
}

class NetworkError implements Exception {
  final String? message;  // رسالة مخصصة لخطأ الشبكة

  NetworkError(this.message);

  String getErrorMessage() {
    return message ?? "Network error occurred. Please check your connection.";
  }
}

class ClientError implements Exception {
  final ErrorModel? errorModel;  // قد يحتوي على تفاصيل الخطأ من العميل

  ClientError(this.errorModel);
  @override
  toString() {
    return errorModel?.errors ?? "this client error";
  }

  String getErrorMessage() {
    return errorModel?.message ?? "Client error occurred. Please try again.";
  }
}

class ServerSideError implements Exception {
  final ErrorModel? errorModel;  // تفاصيل الخطأ من الخادم

  ServerSideError(this.errorModel);

  String getErrorMessage() {
    return errorModel?.message ?? "Server-side error occurred.";
  }
}
