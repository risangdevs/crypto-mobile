import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_mobile/constants/constants.dart';
import 'package:crypto_mobile/customs/custom_shimmer.dart';
import 'package:crypto_mobile/screens/home/asset_controller.dart';
import 'package:crypto_mobile/screens/home/components/price_chart.dart';
import 'package:crypto_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssetListItem extends StatelessWidget {
  final String imageUrl;
  final String assetName;
  final String symbol;
  final String assetId;
  final double assetValue;
  final double assetPriceChange;
  final double assetMarketCap;

  const AssetListItem({
    Key? key,
    required this.imageUrl,
    required this.assetName,
    required this.symbol,
    required this.assetId,
    required this.assetValue,
    required this.assetPriceChange,
    required this.assetMarketCap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AssetController assetController = Get.put(
        AssetController(assetId, assetValue),
        tag: 'websocket_$assetId');
    // Determine background color based on value change
    onTap() => {assetController.fetchHistorical()};
    return Obx(() {
      return InkWell(
          onTap: () => onTap(),
          borderRadius: BorderRadius.circular(8.0),
          child: AnimatedContainer(
            duration: duration500ms,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: assetController.backgroundColor.value,
            ),
            child: Row(
              children: [
                Expanded(
                  child: ListTile(
                    leading: CachedNetworkImage(
                      imageUrl: imageUrl,
                      width: 40.0,
                      height: 40.0,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      placeholder: (context, url) {
                        return CustomShimmer(
                          child: Container(
                            color: kSecondaryColor,
                          ),
                        );
                      },
                    ),
                    title: Text(
                      '$symbol $assetName',
                      style: Theme.of(context).textTheme.titleMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      'Value: \$${formatWithThousandSeparator(assetController.assetPrice.value)}\nCap: \$${formatLargeNumber(assetMarketCap)}',
                      overflow: TextOverflow.visible,
                    ),
                    trailing: Text(
                      '${assetPriceChange >= 0 ? '+' : ''}${assetPriceChange.toStringAsFixed(2)}%',
                      style: TextStyle(
                        color:
                            assetPriceChange >= 0 ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: mediumSmallFontSize,
                      ),
                    ),
                  ),
                ),
                //  if (assetController.historicalData.length > 0)
                //   Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: PriceChart(priceData: assetController.historicalData.value),
                //   ),
                ],
            ),
          ));
    });
  }
}
