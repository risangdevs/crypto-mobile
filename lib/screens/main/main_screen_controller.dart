import 'package:crypto_mobile/screens/home/components/body_home.dart';
import 'package:crypto_mobile/screens/setting/components/body_setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreenController extends GetxController {
  var currentIndex = 0.obs;

  var componentList = const [
    ComponentItem(widget: BodyHome(), title: 'Home'),
    ComponentItem(widget: BodyHome(), title: 'Exchanges'),
    ComponentItem(widget: BodyHome(), title: 'Rates'),
    ComponentItem(widget: BodySetting(), title: 'Settings'),
  ];

  void setCurrentIndex(int index) {
    currentIndex(index);
  }

  getComponent() {
    return componentList[currentIndex.value].widget;
  }
  getTitle() {
    return componentList[currentIndex.value].title;
  }
}

class ComponentItem {
  final Widget widget;
  final String title;

  const ComponentItem({required this.widget, required this.title});
}
