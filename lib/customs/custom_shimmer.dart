import 'package:crypto_mobile/constants/palettes.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: deepCyan.withOpacity(0.1),
      highlightColor: deepBlue.withOpacity(0.2),
      child: child,
    );
  }
}
