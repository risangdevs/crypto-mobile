import 'package:crypto_mobile/customs/custom_shimmer.dart';
import 'package:flutter/material.dart';

List<Widget> shimmerHome = buildShimmerList(20);

List<Widget> buildShimmerList(int itemCount) {
  return List.generate(
    itemCount,
    (index) => Column(
      children: [
        CustomShimmer(
          child: Container(
            width: double.infinity,
            height: 80.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    ),
  );
}
