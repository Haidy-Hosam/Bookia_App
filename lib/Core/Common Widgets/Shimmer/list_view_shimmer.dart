import 'package:bookia_app/Core/Functions/extentions.dart';
import 'package:flutter/material.dart';

import 'shimmer_base.dart';

class ListViewShimmer extends StatelessWidget {
  const ListViewShimmer({
    super.key,
    this.itemCount = 6,
    this.itemSpacing = 12,
    this.padding = EdgeInsets.zero,
    this.physics = const NeverScrollableScrollPhysics(),
    this.shrinkWrap = true,
    this.itemExtent = 84,
  });

  final int itemCount;
  final double itemSpacing;
  final EdgeInsetsGeometry padding;
  final ScrollPhysics physics;
  final bool shrinkWrap;
  final double itemExtent;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      physics: physics,
      shrinkWrap: shrinkWrap,
      itemCount: itemCount,
      separatorBuilder: (_, __) => SizedBox(height: itemSpacing),
      itemBuilder: (context, index) {
        return const _ListViewShimmerItem();
      },
    );
  }
}

class _ListViewShimmerItem extends StatelessWidget {
  const _ListViewShimmerItem();

  @override
  Widget build(BuildContext context) {
    return ShimmerBase(
      child: Row(
        children: [
          const ShimmerBlock(height: 84, width: 84, radius: 16),
          12.w,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                ShimmerBlock(height: 14, width: double.infinity, radius: 8),
                SizedBox(height: 10),
                ShimmerBlock(height: 12, width: 160, radius: 8),
                SizedBox(height: 10),
                ShimmerBlock(height: 12, width: 110, radius: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
