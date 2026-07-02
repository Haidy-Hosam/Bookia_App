import 'package:flutter/material.dart';

import 'shimmer_base.dart';

class BannerShimmer extends StatelessWidget {
  const BannerShimmer({super.key, this.height = 196});

  final double height;

  @override
  Widget build(BuildContext context) {
    return ShimmerBase(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: height,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Stack(
            children: [
              Positioned(
                left: 16,
                right: 16,
                top: 16,
                child: ShimmerBlock(height: 18, width: double.infinity, radius: 8),
              ),
              Positioned(
                left: 16,
                right: 80,
                top: 46,
                child: ShimmerBlock(height: 14, width: double.infinity, radius: 8),
              ),
              Positioned(
                left: 16,
                right: 120,
                bottom: 16,
                child: ShimmerBlock(height: 12, width: double.infinity, radius: 8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}