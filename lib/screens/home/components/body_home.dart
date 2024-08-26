import 'package:crypto_mobile/constants/constants.dart';
import 'package:crypto_mobile/networks/network_constants.dart';
import 'package:crypto_mobile/screens/home/components/home_asset_list_item.dart';
import 'package:crypto_mobile/screens/home/components/shimmer_home.dart';
import 'package:crypto_mobile/screens/home/controller_body_home.dart';
import 'package:crypto_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController(), tag: 'assetList');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Obx(() {
        switch (controller.status.value) {
          case Status.LOADING:
            return buildLoading(context);
          case Status.COMPLETED:
            return buildCompleted(context);
          case Status.ERROR:
            return buildError(context);
          default:
            return buildLoading(context);
        }
      }),
    );
  }
}

Widget buildCompleted(BuildContext context) {
  HomeController controller = Get.find(tag: 'assetList');
  return Obx(
    () => SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: List.generate(
          controller.data.length,
          (index) {
            var item = controller.data[index];
            return AssetListItem(
                imageUrl: logoUrl(item.symbol),
                assetName: item.name,
                assetValue: stringToDouble(item.priceUsd),
                assetPriceChange: stringToDouble(item.changePercent24Hr));
          },
        ),
      ),
    ),
  );
}

Widget buildError(BuildContext context) {
  return Container();
}

Widget buildLoading(BuildContext context) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: shimmerHome,
      ),
    ),
  );
}
