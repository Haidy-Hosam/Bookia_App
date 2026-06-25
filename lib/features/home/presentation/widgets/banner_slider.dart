import 'package:bookia_app/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({
    super.key,
    required this.pageController,
    required this.bannerImages,
    required this.onPageChanged,
  });

  final PageController pageController;
  final List<String> bannerImages;
  final ValueChanged<int> onPageChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 196,
      child: PageView.builder(
        controller: pageController,
        itemCount: bannerImages.length,
        onPageChanged: onPageChanged,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(bannerImages[index], fit: BoxFit.cover),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.blackColor.withValues(alpha: 0.06),
                        AppColors.blackColor.withValues(alpha: 0.15),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
