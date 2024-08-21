import 'package:crypto_mobile/models/asset_models.dart';
import 'package:crypto_mobile/networks/api_provider.dart';
import 'package:crypto_mobile/networks/network_constants.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var status = Status.LOADING.obs;

  var data = <Asset>[].obs;


  Future<void> fetch() async {
    status(Status.LOADING);
    try {
      var response = await HomeServices().get();
      data(response.data);
      status(Status.COMPLETED);
    } catch (error) {
      print(error);
      status(Status.ERROR);
    }
  }

  @override
  void onInit() {
    fetch();
    super.onInit();
  }
}

class HomeServices {
  final ApiProvider apiProvider = ApiProvider();

  Future<AssetListData> get() async {
    var queryParameters = <String, dynamic>{};
    final response = await apiProvider.dio.get(
      Path.asset,
      queryParameters: queryParameters,
    );
    return AssetListData.fromJson(response.data);
  }
}