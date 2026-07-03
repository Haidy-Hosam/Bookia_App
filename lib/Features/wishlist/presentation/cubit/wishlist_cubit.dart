import 'dart:developer';
import 'package:bookia_app/Features/Home/data/Model/best_seller_response/datum.dart';
import 'package:bookia_app/Features/wishlist/data/model/wishlist_response/wishlist.dart';
import 'package:bookia_app/Features/wishlist/data/repo/wishlistrepo.dart';
import 'package:bookia_app/Features/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitialState());

  List<Datum> wishlistItems = [];

  Future<void> loadWishlist() async {
    emit(WishlistLoadingState());

    final wishlist = await WishlistRepository.getWishlist();

    if (wishlist != null) {
      _updateWishlist(wishlist);
      emit(WishlistSuccessState());
    } else {
      log('Failed to load wishlist');
      emit(WishlistErrorState('Something went wrong, Please try again'));
    }
  }

  Future<void> removeFromWishlist() async {
    emit(WishlistLoadingState());

    final wishlist = await WishlistRepository.removeFromWishlist();

    if (wishlist != null) {
      _updateWishlist(wishlist);
      emit(WishlistSuccessState());
    } else {
      log('Failed to remove item from wishlist');
      emit(WishlistErrorState('Something went wrong, Please try again'));
    }
  }

  void _updateWishlist(Wishlist wishlist) {
    wishlistItems = wishlist.data ?? [];
  }
}