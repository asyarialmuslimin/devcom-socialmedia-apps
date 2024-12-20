import 'package:devcom_demo/app/data/remote/remote_datasource.dart';
import 'package:devcom_demo/app/data/remote/response/listpostingan_response.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RemoteDatasource remoteDatasource = RemoteDatasource();

  final isLoading = true.obs;
  final List<ListPostinganResponse> listPostingan =
      <ListPostinganResponse>[].obs;

  @override
  void onInit() {
    super.onInit();
    getListPostingan();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void getListPostingan() {
    remoteDatasource.getListPostingan().then((result) {
      listPostingan.clear();
      listPostingan.addAll(result.reversed);
      isLoading.value = false;
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
