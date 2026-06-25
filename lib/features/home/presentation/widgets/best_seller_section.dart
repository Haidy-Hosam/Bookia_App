import 'package:bookia_app/core/utils/extensions.dart';
import 'package:bookia_app/core/styles/app_colors.dart';
import 'package:bookia_app/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class BestSellerSection extends StatelessWidget {
  const BestSellerSection({super.key});

  final List<_BookItem> _bestSellerBooks = const [
    _BookItem(title: 'The Great Gatsby', price: '\$10.99'),
    _BookItem(title: 'To Kill a Mockingbird', price: '\$12.99'),
    _BookItem(title: '1984', price: '\$9.99'),
    _BookItem(title: 'Pride and Prejudice', price: '\$11.99'),
    _BookItem(title: 'The Catcher in the Rye', price: '\$8.99'),
    _BookItem(title: 'The Hobbit', price: '\$14.99'),
  ];

  @override
  Widget build(BuildContext context) {
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
        GridView.builder(
          itemCount: _bestSellerBooks.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 18,
            crossAxisSpacing: 18,
            childAspectRatio: 0.62,
          ),
          itemBuilder: (context, index) {
            return _buildBookCard(_bestSellerBooks[index]);
          },
        ),
      ],
    );
  }

  Widget _buildBookCard(_BookItem bookItem) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.borderColor),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkColor.withValues(alpha: 0.06),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Container(
              height: 170,
              width: double.infinity,
              color: AppColors.secondaryColor.withValues(alpha: 0.45),
              child: const Center(
                child: Icon(
                  Icons.menu_book_rounded,
                  size: 62,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
          10.h,
          Text(
            bookItem.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.headline.copyWith(
              color: AppColors.blackColor,
              fontSize: 18,
            ),
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                bookItem.price,
                style: TextStyles.title.copyWith(
                  color: AppColors.blackColor,
                  fontSize: 22,
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 42,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.darkColor,
                    foregroundColor: AppColors.backgroundColor,
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Buy',
                    style: TextStyles.subtitle.copyWith(
                      color: AppColors.backgroundColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BookItem {
  final String title;
  final String price;

  const _BookItem({required this.title, required this.price});
}
