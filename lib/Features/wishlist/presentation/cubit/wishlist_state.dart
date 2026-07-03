abstract class WishlistState {}

class WishlistInitialState extends WishlistState {}

class WishlistLoadingState extends WishlistState {}

class WishlistSuccessState extends WishlistState {}

class WishlistErrorState extends WishlistState {
	final String message;

	WishlistErrorState(this.message);
}
