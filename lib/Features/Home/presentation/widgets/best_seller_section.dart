import 'package:bookia_app/Core/Functions/extentions.dart';
import 'package:bookia_app/Core/Styles/Appcolors.dart';
import 'package:bookia_app/Core/Styles/text_styles.dart';
import 'package:bookia_app/Core/Common%20Widgets/Shimmer/book_card_shimmer.dart';
import 'package:bookia_app/Features/Home/presentation/Cubit/home_cubit.dart';
import 'package:bookia_app/Features/Home/presentation/Cubit/home_state.dart';
import 'package:bookia_app/Features/Home/presentation/Widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerSection extends StatelessWidget {
  const BestSellerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        final isLoading = state is HomeLoadingState || state is HomeinitState;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Best Seller',
              style: TextStyles.headline.copyWith(
                color: AppColors.blackColor,
                fontSize: 30,
              ),
            ),
            20.h,
            if (isLoading)
              GridView.builder(
                itemCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 18,
                  childAspectRatio: 0.62,
                ),
                itemBuilder: (context, index) {
                  return const BookCardShimmer();
                },
              )
            else
              GridView.builder(
                itemCount: cubit.products.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                // علشان نمنع الـ GridView من إنه يحاول يعمل Scroll داخل Scroll.
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 18,
                  childAspectRatio: 0.62,
                ),
                itemBuilder: (context, index) {
                  var book = cubit.products[index];
                  return GestureDetector(
                    onTap: () {
                      // pushTo(context, Routes.details, extra: book);
                    },
                    child: BookCard(book: book),
                  );
                },
              ),
          ],
        );
      },
    );
  }
}
