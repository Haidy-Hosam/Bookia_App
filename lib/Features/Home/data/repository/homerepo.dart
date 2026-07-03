import 'dart:developer';
import 'package:bookia_app/Core/Services/apis/apis.dart';
import 'package:bookia_app/Core/Services/apis/dio_provider.dart';
import 'package:bookia_app/Features/Home/data/Model/best_seller_response/best_seller_response.dart';
import 'package:bookia_app/Features/Home/data/Model/slider_response/slider_response.dart';

class HomeRepo {
  static Future<SliderResponse?> getslider() async {
    try {
      var response = await DioProvider.get(endpoint: APIs.sliderEndpoint);
      if (response.statusCode == 200) {
        return SliderResponse.fromJson(response.data); // الداتا جايه ك JSON
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  // ================================================================================
  static Future<BestSellerResponse?> getbestseller() async {
    try {
      var response = await DioProvider.get(endpoint: APIs.bestsallerEndpoint);
      if (response.statusCode == 200) {
        return BestSellerResponse.fromJson(response.data); // الداتا جايه ك JSON
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
