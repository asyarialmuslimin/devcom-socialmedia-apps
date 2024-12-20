import 'package:devcom_demo/app/data/remote/remote_datasource.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddpostController extends GetxController {

  TextEditingController captionController = TextEditingController();
  RemoteDatasource remoteDatasource = RemoteDatasource();

  final isPostEnabled = false.obs;
  final photoPath = "".obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void onCaptionChanged(String value) {
    isPostEnabled.value = value.isNotEmpty;
  }

  void selectPhoto() async {
    try {
      // Memilih file dari galeri
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image, // Batasi ke tipe file gambar
      );

      if (result != null && result.files.single.path != null) {
        photoPath.value = result.files.single.path!;
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void sendPost() {
    isLoading.value = true;
    remoteDatasource.sendPost(photoPath.value, captionController.text).then((result) {
      if (result) {
        isLoading.value = false;
        Get.back(result: true);
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    captionController.dispose();
  }
}
