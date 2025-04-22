// To parse this JSON data, do
//
//     final errorResponseEntite = errorResponseEntiteFromJson(jsonString);

import 'dart:convert';

ErrorResponseEntity errorResponseEntityFromJson(String str) =>
    ErrorResponseEntity.fromJson(json.decode(str));

class ErrorResponseEntity {
  final int errorCode;
  final String message;
  final String error;

  ErrorResponseEntity({
    required this.errorCode,
    required this.message,
    required this.error,
  });

  factory ErrorResponseEntity.fromRawJson(String str) =>
      ErrorResponseEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ErrorResponseEntity.fromJson(Map<String, dynamic> json) {
   return ErrorResponseEntity(
      error: json['error'].toString(),
      errorCode: json['code'] ==null ?0 : json['code'],
      message:
      json["message"].toString().replaceAll("[", "").replaceAll("]", ""),
    );
  }
  Map<String, dynamic> toJson() => {
        "code": errorCode,
        "error": error,
        "message": message,
      };
}
