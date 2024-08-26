import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_mobile/constants/constants.dart';
import 'package:crypto_mobile/customs/custom_shimmer.dart';
import 'package:flutter/material.dart';

class AssetListItem extends StatelessWidget {
  final String imageUrl;
  final String assetName;
  final double assetValue;
  final double assetPriceChange;

  const AssetListItem({
    Key? key,
    required this.imageUrl,
    required this.assetName,
    required this.assetValue,
    required this.assetPriceChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
        'Value: \$${assetValue.toStringAsFixed(2)}',
        style: TextStyle(color: Colors.grey[600]),
      ),
      trailing: Text(
        '${assetPriceChange >= 0 ? '+' : ''}${assetPriceChange.toStringAsFixed(2)}%',
        style: TextStyle(
          color: assetPriceChange >= 0 ? Colors.green : Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
