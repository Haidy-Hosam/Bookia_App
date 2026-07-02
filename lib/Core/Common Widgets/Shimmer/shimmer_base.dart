import 'package:bookia_app/Core/Styles/Appcolors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBase extends StatelessWidget {
  const ShimmerBase({
    super.key,
    required this.child,
    this.baseColor = const Color.fromARGB(255, 86, 128, 212),
    // this.baseColor = const Color(0xFFE8ECF4),
    this.highlightColor = const Color(0xFFF7F8F9),
  });

  final Widget child;
  final Color baseColor;
  final Color highlightColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: child,
    );
  }
}

class ShimmerBlock extends StatelessWidget {
  const ShimmerBlock({
    super.key,
    required this.height,
    required this.width,
    this.radius = 12,
    this.margin = EdgeInsets.zero,
    this.color,
  });

  final double height;
  final double width;
  final double radius;
  final EdgeInsetsGeometry margin;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color ?? AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}