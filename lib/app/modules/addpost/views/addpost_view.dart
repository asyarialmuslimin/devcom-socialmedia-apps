import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/addpost_controller.dart';

class AddpostView extends GetView<AddpostController> {
  const AddpostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(
                              0xff324472,
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => ElevatedButton(
                          onPressed:
                              controller.isPostEnabled.value ? () {
                            controller.sendPost();
                              } : null,
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            backgroundColor: controller.isPostEnabled.value
                                ? Color(
                                    0xff324472,
                                  )
                                : Colors.white,
                          ),
                          child: Text(
                            "Post",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextField(
                    controller: controller.captionController,
                    minLines: 8,
                    maxLines: 10,
                    decoration: InputDecoration(
                      hintText: "What's Happening?",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: controller.onCaptionChanged,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          controller.selectPhoto();
                        },
                        child: Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 27,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Obx(
                        () => controller.photoPath.value.isEmpty
                            ? Container()
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  File(controller.photoPath.value),
                                  width: 75,
                                  height: 75,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Obx(() => controller.isLoading.value ? Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withAlpha(100),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ):Container()),
          ],
        ),
      ),
    );
  }
}
