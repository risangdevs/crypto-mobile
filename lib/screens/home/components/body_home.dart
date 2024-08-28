import 'package:crypto_mobile/constants/constants.dart';
import 'package:crypto_mobile/customs/custom_sized_box.dart';
import 'package:crypto_mobile/models/asset_models.dart';
import 'package:crypto_mobile/networks/network_constants.dart';
import 'package:crypto_mobile/screens/home/components/home_asset_list_item.dart';
import 'package:crypto_mobile/screens/home/components/shimmer_home.dart';
import 'package:crypto_mobile/screens/home/controller_body_home.dart';
import 'package:crypto_mobile/themes/text_style.dart';
import 'package:crypto_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  BodyHomeState createState() => BodyHomeState();
}

class BodyHomeState extends State<BodyHome>
    with SingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode(); // FocusNode for the search input
  List<Asset> filteredData = [];
  bool isSearchVisible = false; // Flag to show or hide the search input
  bool isFiltered = false; // Flag to indicate if data is filtered
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    var controller = Get.put(HomeController(), tag: 'assetList');
    filteredData =
        controller.data; // Initialize filtered data with full asset list

    // Initialize animation controller
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // Define the slide animation from top to bottom
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero).animate(
            CurvedAnimation(
                parent: _animationController, curve: Curves.easeInOut));
  }

  void _toggleSearchVisibility() {
    setState(() {
      isSearchVisible = !isSearchVisible;
      if (isSearchVisible) {
        _animationController.forward(); // Slide in
        searchFocusNode.requestFocus(); // Request focus on search input
      } else {
        _animationController.reverse(); // Slide out
        searchFocusNode.unfocus(); // Unfocus search input
      }
    });
  }

  void _filterAssets(String query) {
    var controller = Get.find<HomeController>(tag: 'assetList');
    setState(() {
      if (query.isEmpty) {
        filteredData = controller.data;
        isFiltered = false; // Reset filter status
      } else {
        filteredData = controller.data
            .where((item) =>
                item.name.toLowerCase().contains(query.toLowerCase()) ||
                item.symbol.toLowerCase().contains(query.toLowerCase()))
            .toList();
        isFiltered = true; // Set filter status
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose(); // Dispose the animation controller
    searchFocusNode.dispose(); // Dispose the focus node
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController(), tag: 'assetList');
    return Scaffold(
      body: Stack(
        children: [
          Padding(
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
          ),
          // Positioned search input
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SlideTransition(
              position: _slideAnimation,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(kDefaultPadding,
                    kDefaultPadding, kDefaultPadding, kDefaultPadding),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        focusNode: searchFocusNode, // Attach the focus node
                        onChanged: _filterAssets,
                        onEditingComplete: _toggleSearchVisibility,
                        decoration: const InputDecoration(
                          hintText: 'Search assets...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        _filterAssets(searchController.text);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: FloatingActionButton(
              onPressed: _toggleSearchVisibility,
              child: Icon(isSearchVisible ? Icons.close : Icons.search),
            ),
          ),
          if (isFiltered)
            Positioned(
              bottom: 40,
              right: 40,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  filteredData.length.toString(),
                  style: lightSmallTextStyle,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget buildCompleted(BuildContext context) {
    return Obx(
      () {
        return ListView.builder(
          padding: isSearchVisible
              ? const EdgeInsets.only(top: kDefaultPadding * 4)
              : const EdgeInsets.only(
                  top: kDefaultPadding), // To leave space for the search bar
          itemCount: filteredData.length,
          itemBuilder: (context, index) {
            var item = filteredData[index];
            return Column(
              children: [
                const CustomSizedBox(),
                AssetListItem(
                  imageUrl: logoUrl(item.symbol),
                  assetId: item.id,
                  symbol: item.symbol,
                  assetName: item.name,
                  assetValue: stringToDouble(item.priceUsd),
                  assetPriceChange: stringToDouble(item.changePercent24Hr),
                  assetMarketCap: stringToDouble(item.marketCapUsd),
                ),
                const CustomSizedBox(),
              ],
            );
          },
        );
      },
    );
  }

  Widget buildError(BuildContext context) {
    return Container();
  }

  Widget buildLoading(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        child: Column(
          children: shimmerHome,
        ),
      ),
    );
  }
}
