import 'package:bookia_app/Core/Common%20Widgets/primary_elevated_button.dart';
import 'package:bookia_app/Core/Functions/extentions.dart';
import 'package:bookia_app/Core/Styles/Appcolors.dart';
import 'package:bookia_app/Core/Styles/text_styles.dart';
import 'package:bookia_app/Core/routes/navigation.dart';
import 'package:bookia_app/Core/routes/routes.dart';
import 'package:bookia_app/Features/Home/data/Model/best_seller_response/datum.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
    required this.book,
    this.onRemoveFromWishlist,
    this.onRefresh,
  });

  final Datum book;

  final VoidCallback? onRemoveFromWishlist;
  final VoidCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // pushTo(context, Routes.details, extra: book).then((value) {
        //   onRefresh?.call();
        // });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.backgroundColor,
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Hero(
                tag: book.id ?? '',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    book.image ?? '',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(child: Text('Error'));
                    },
                  ),
                ),
              ),
            ),
            10.h,
            SizedBox(
              height: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    book.name ?? '',
                    style: TextStyles.body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            10.h,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(book.price ?? '', style: TextStyles.body),
                onRemoveFromWishlist != null
                    ? IconButton(
                        onPressed: onRemoveFromWishlist,
                        icon: Icon(Icons.delete, color: AppColors.errorColor),
                      )
                    : PrimaryElevatedBotton(
                        minHeight: 35,
                        minWidth: 60,
                        backgroundColor: AppColors.darkColor,

                        title: 'Buy',
                        onPressed: () {},
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}