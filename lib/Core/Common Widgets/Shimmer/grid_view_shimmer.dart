import 'package:flutter/material.dart';

import 'shimmer_base.dart';

class GridViewShimmer extends StatelessWidget {
  const GridViewShimmer({
    super.key,
    this.itemCount = 4,
    this.crossAxisCount = 2,
    this.mainAxisSpacing = 18,
    this.crossAxisSpacing = 18,
    this.childAspectRatio = 0.62,
    this.padding = EdgeInsets.zero,
    this.physics = const NeverScrollableScrollPhysics(),
    this.shrinkWrap = true,
  });

  final int itemCount;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double childAspectRatio;
  final EdgeInsetsGeometry padding;
  final ScrollPhysics physics;
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: padding,
      physics: physics,
      shrinkWrap: shrinkWrap,
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) {
        return const _GridShimmerItem();
      },
    );
  }
}

class _GridShimmerItem extends StatelessWidget {
  const _GridShimmerItem();

  @override
  Widget build(BuildContext context) {
    return ShimmerBase(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFE8ECF4)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            ShimmerBlock(height: 160, width: double.infinity, radius: 14),
            SizedBox(height: 12),
            ShimmerBlock(height: 14, width: 120, radius: 8),
            SizedBox(height: 10),
            ShimmerBlock(height: 12, width: 80, radius: 8),
            Spacer(),
            ShimmerBlock(height: 42, width: double.infinity, radius: 10),
          ],
        ),
      ),
    );
  }
}