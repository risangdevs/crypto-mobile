import 'dart:convert';
import 'package:crypto_mobile/constants/constants.dart';
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

  /// Accept the assetName and initial assetValue in the constructor
  AssetController(this.assetId, double initialValue) {
    // Set the initial value from the props
    assetPrice.value = initialValue;
  }

  @override
  void onInit() {
    // Initialize WebSocket connection, subscribe only to the specific asset
    webSocketService =
        WebSocketService('wss://ws.coincap.io/prices?assets=$assetId');

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
          Future.delayed(duration500ms, () {
            backgroundColor.value = Colors.transparent;
          });
        } else if (assetPrice.value < prevPrice.value) {
          backgroundColor.value =
              Colors.red.withOpacity(0.2); // Red for decrease
          // Reset background color after 1 second
          Future.delayed(duration500ms, () {
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
