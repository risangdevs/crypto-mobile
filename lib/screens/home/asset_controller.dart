import 'dart:convert';
import 'package:crypto_mobile/constants/constants.dart';
import 'package:crypto_mobile/models/asset_models.dart';
import 'package:crypto_mobile/networks/api_provider.dart';
import 'package:crypto_mobile/networks/network_constants.dart';
import 'package:crypto_mobile/networks/websocket.dart';
import 'package:crypto_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssetController extends GetxController {
  var assetPrice = 0.0.obs;
  var prevPrice = 0.0.obs;
  var backgroundColor = Colors.transparent.obs; // For managing background color

  late WebSocketService webSocketService;
  final String assetId;

  var historicalStatus = Status.LOADING.obs;

  var historicalData = <HistoricalData>[].obs;

  /// Accept the assetName and initial assetValue in the constructor
  AssetController(this.assetId, double initialValue) {
    // Set the initial value from the props
    assetPrice.value = stringToDouble(initialValue.toStringAsFixed(6));
  }
  Future<void> fetchHistorical() async {
    historicalStatus(Status.LOADING);
    try {
      var response = await AssetListItemServices().get(assetId, {'interval':'1d'});
      historicalData(response.data);
      historicalStatus(Status.COMPLETED);
    } catch (error) {
      print(error);
      historicalStatus(Status.ERROR);
    }
  }

  @override
  void onInit() {
    // Initialize WebSocket connection, subscribe only to the specific asset
    webSocketService =
        WebSocketService('${wsHost}prices?assets=$assetId');

    // Listen to WebSocket stream and update values
    webSocketService.stream.listen((message) {
      var data = jsonDecode(message);

      // Check if the assetId matches before updating
      if (data.containsKey(assetId)) {
        prevPrice.value = assetPrice.value;
        assetPrice.value = stringToDouble(data[assetId]);

        if (prevPrice.value == 0.0) {
          backgroundColor.value = Colors.transparent;
        } else if (assetPrice.value > prevPrice.value) {
          backgroundColor.value =
              Colors.green.withOpacity(0.2); // Green for increase
          // Reset background color after 1 second
          Future.delayed(duration1s, () {
            backgroundColor.value = Colors.transparent;
          });
        } else if (assetPrice.value < prevPrice.value) {
          backgroundColor.value =
              Colors.red.withOpacity(0.2); // Red for decrease
          // Reset background color after 1 second
          Future.delayed(duration1s, () {
            backgroundColor.value = Colors.transparent;
          });
        } else {
          backgroundColor.value = Colors.transparent; // No change
        }
        // Assuming price change data is part of the message (you can adjust this based on your actual data structure)
      }
    });

    super.onInit();
  }

  @override
  void onClose() {
    webSocketService.close();
    super.onClose();
  }
}

class AssetListItemServices {
  final ApiProvider apiProvider = ApiProvider();

  Future<HistoricalDataList> get(assetId, queryParameters) async {
    var queryParameters = <String, dynamic>{};
    final response = await apiProvider.dio.get(
      Path.assetHistorical(assetId),
      queryParameters: {'interval' : 'h1'},
    );
    return HistoricalDataList.fromJson(response.data);
  }
}