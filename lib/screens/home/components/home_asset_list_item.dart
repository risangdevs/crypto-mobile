import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_mobile/constants/constants.dart';
import 'package:crypto_mobile/customs/custom_shimmer.dart';
import 'package:crypto_mobile/screens/home/asset_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssetListItem extends StatelessWidget {
  final String imageUrl;
  final String assetName;
  final String assetId;
  final double assetValue;
  final double assetPriceChange;

  const AssetListItem({
    Key? key,
    required this.imageUrl,
    required this.assetName,
    required this.assetId,
    required this.assetValue,
    required this.assetPriceChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AssetController assetController = Get.put(
        AssetController(assetId, assetValue),
        tag: 'websocket_$assetId');
    // Determine background color based on value change

    return Obx(() {
      return AnimatedContainer(
          duration: duration500ms,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: assetController.backgroundColor.value,
          ),
          child: ListTile(
            leading: CachedNetworkImage(
              imageUrl: imageUrl,
              width: 40.0,
              height: 40.0,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              placeholder: (context, url) {
                return CustomShimmer(
                  child: Container(
                    color: kSecondaryColor,
                  ),
                );
              },
            ),
            title: Text(
              assetName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Value: \$${assetController.assetPrice.value}',
              style: TextStyle(color: Colors.grey[600]),
            ),
            trailing: Text(
              '${assetPriceChange >= 0 ? '+' : ''}${assetPriceChange.toStringAsFixed(2)}%',
              style: TextStyle(
                color: assetPriceChange >= 0 ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ));
    });
  }
}
