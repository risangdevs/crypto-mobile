import 'package:crypto_mobile/constants/constants.dart';
import 'package:crypto_mobile/customs/custom_shimmer.dart';
import 'package:crypto_mobile/screens/home/controller_body_home.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crypto_mobile/networks/network_constants.dart';



class BodyHome extends StatelessWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  
  Widget build(BuildContext context) {
    var controller = Get.put(
      HomeController(),
      tag: 'assetList'
    );
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
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
        children: List.generate(
          controller.data.length,
          (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(controller.data[index].name),
            );
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
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(6, (index) {
          return Entry.all(
            delay: Duration(milliseconds: 50 * index + 1),
            child: CustomShimmer(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: kDefaultPadding * 0.5,
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: kDefaultPadding * 0.5,
                    horizontal: kDefaultPadding * 0.8,
                  ),
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    "          ",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }