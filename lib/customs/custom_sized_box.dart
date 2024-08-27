import 'package:crypto_mobile/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomSizedBox extends SizedBox {
  const CustomSizedBox({
    Key? key,
    double height = kDefaultPadding * 0.2,
    double width = 0.0,
  }) : super(
          key: key,
          height: height,
          width: width,
        );
}
