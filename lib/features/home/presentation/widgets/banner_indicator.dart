import 'package:bookia_app/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class BannerIndicator extends StatelessWidget {
  const BannerIndicator({
    super.key,
    required this.currentIndex,
    required this.length,
  });

  final int currentIndex;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (index) => _buildIndicatorDot(index)),
    );
  }

  Widget _buildIndicatorDot(int index) {
    final bool isActive = index == currentIndex;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: isActive ? 26 : 8,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryColor : AppColors.borderColor,
        borderRadius: BorderRadius.circular(99),
      ),
    );
  }
}
