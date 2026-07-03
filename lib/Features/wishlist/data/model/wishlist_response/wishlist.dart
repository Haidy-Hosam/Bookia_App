
import 'package:bookia_app/Features/Home/data/Model/best_seller_response/datum.dart';

class Wishlist {
  List<Datum>? data;
  String? message;
  List<dynamic>? error;
  int? status;

  Wishlist({this.data, this.message, this.error, this.status});

  factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
        .toList(),
    message: json['message'] as String?,
    error: json['error'] as List<dynamic>?,
    status: json['status'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'data': data?.map((e) => e.toJson()).toList(),
    'message': message,
    'error': error,
    'status': status,
  };
}
