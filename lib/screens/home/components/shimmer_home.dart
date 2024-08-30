import 'package:crypto_mobile/customs/custom_shimmer.dart';
import 'package:flutter/material.dart';

List<Widget> shimmerHome(BuildContext context) {
  return buildShimmerList(20, context);
}

List<Widget> buildShimmerList(int itemCount, BuildContext context) {
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
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    ),
  );
}
