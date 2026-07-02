import 'package:bookia_app/Core/Functions/extentions.dart';
import 'package:flutter/material.dart';

import 'shimmer_base.dart';

class BookCardShimmer extends StatelessWidget {
  const BookCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerBase(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFE8ECF4)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ShimmerBlock(height: 200, width: double.infinity, radius: 14),
            10.h,
            const ShimmerBlock(height: 18, width: double.infinity, radius: 8),
            const Spacer(),
            Row(
              children: const [
                ShimmerBlock(height: 22, width: 72, radius: 8),
                Spacer(),
                ShimmerBlock(height: 42, width: 92, radius: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}