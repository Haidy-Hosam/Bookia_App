import 'dart:developer';
import 'package:bookia_app/Core/Services/apis/apis.dart';
import 'package:bookia_app/Core/Services/apis/dio_provider.dart';
import 'package:bookia_app/Features/wishlist/data/model/wishlist_response/wishlist.dart';

class WishlistRepository {
  static Future<Wishlist?> getWishlist() async {
    try {
      var response = await DioProvider.get(
        endpoint: APIs.wishlistEndpoint,
        // ********** Later ***********
        // headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      );
      if (response.statusCode == 200) {
        return Wishlist.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  // ----------------------------------------------------------------------------
  static Future<Wishlist?> addToWishlist() async {
    try {
      var response = await DioProvider.post(
        endpoint: APIs.AddTowishlistEndpoint,
        // ********** Later ***********
        // headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      );
      if (response.statusCode == 200) {
        return Wishlist.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  // ----------------------------------------------------------------------------
  static Future<Wishlist?> removeFromWishlist() async {
    try {
      var response = await DioProvider.delete(
        endpoint: APIs.RemoveFromwishlistEndpoint,
        // ********** Later ***********
        // headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      );
      if (response.statusCode == 200) {
        return Wishlist.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}

class WishListRepo {
  static Future<Wishlist?> getwishlist() => WishlistRepository.getWishlist();

  static Future<Wishlist?> AddTowishlist() => WishlistRepository.addToWishlist();

  static Future<Wishlist?> RemoveFromwishlist() =>
      WishlistRepository.removeFromWishlist();
}
