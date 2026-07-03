import 'package:bookia_app/Core/Common%20Widgets/Shimmer/book_card_shimmer.dart';
import 'package:bookia_app/Core/Common%20Widgets/my_body_view.dart';
import 'package:bookia_app/Features/Home/presentation/Widgets/book_card.dart';
import 'package:bookia_app/Features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:bookia_app/Features/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wishlist')),
      body: BlocConsumer<WishlistCubit, WishlistState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          final cubit = context.read<WishlistCubit>();
          final isLoading =
              state is WishlistLoadingState || state is WishlistInitialState;

          return MyBodyView(
            child: isLoading
                ? GridView.builder(
                    itemCount: 4,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 18,
                      crossAxisSpacing: 18,
                      childAspectRatio: 0.62,
                    ),
                    itemBuilder: (context, index) {
                      return const BookCardShimmer();
                    },
                  )
                : GridView.builder(
                    itemCount: cubit.wishlistItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 18,
                      crossAxisSpacing: 18,
                      childAspectRatio: 0.62,
                    ),
                    itemBuilder: (context, index) {
                      var book = cubit.wishlistItems[index];
                      return BookCard(book: book);
                    },
                  ),
          );
        },
      ),
    );
  }
}
