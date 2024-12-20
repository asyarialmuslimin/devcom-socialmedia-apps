import 'package:devcom_demo/app/modules/home/widget/other_story_item.dart';
import 'package:devcom_demo/app/modules/home/widget/post_card_item.dart';
import 'package:devcom_demo/app/modules/home/widget/your_story_widget.dart';
import 'package:devcom_demo/app/routes/app_pages.dart';
import 'package:devcom_demo/utils/const.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await Get.toNamed(Routes.ADDPOST);
          if (result != null) {
            controller.getListPostingan();
          }
        },
        elevation: 2.0,
        backgroundColor: Color(0xff758ECE),
        child: Icon(Icons.add, color: Colors.white,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: InkWell(
                  onTap: (){},
                  child: Image.asset("assets/images/menu_home.png",),
                ),
              ),
              Container(
                child: InkWell(
                  onTap: (){},
                  child: Image.asset("assets/images/menu_compass.png",),
                ),
              ),
              Container(
                child: InkWell(
                  onTap: (){},
                  child: Image.asset("assets/images/menu_video.png",),
                ),
              ),
              Container(
                child: InkWell(
                  onTap: (){},
                  child: Image.asset("assets/images/menu_account.png",),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logo_devcom.png",
                    width: 28,
                    height: 33,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Devcom",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(
                        0xff324472,
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  Badge(
                    label: Text("4"),
                    child: Icon(
                      Icons.notifications,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Badge(
                    label: Text("3"),
                    child: Icon(
                      Icons.inbox_rounded,
                      size: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    YourStoryWidget(),
                    OtherStoryItem(
                        imagePath: "assets/images/story2.png",
                        userName: "Rose"),
                    OtherStoryItem(
                        imagePath: "assets/images/story3.png",
                        userName: "Yanti"),
                    OtherStoryItem(
                        imagePath: "assets/images/story4.png",
                        userName: "Siti"),
                    OtherStoryItem(
                        imagePath: "assets/images/story5.png",
                        userName: "Marni"),
                    OtherStoryItem(
                        imagePath: "assets/images/story4.png",
                        userName: "Kembarane Siti"),
                    OtherStoryItem(
                        imagePath: "assets/images/story3.png",
                        userName: "Yanti Lagi"),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              DefaultTabController(
                length: 2,
                child: TabBar(
                  labelColor: Colors.black,
                  labelStyle: TextStyle(fontSize: 18),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: Colors.black,
                  tabs: [
                    Tab(
                      text: "Home",
                    ),
                    Tab(
                      text: "For You",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Obx(
                () => Expanded(
                  child: Container(
                    color: Color(0xffF7F8FA),
                    child: controller.isLoading.value
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            itemCount: controller.listPostingan.length,
                            itemBuilder: (context, index) => PostCardItem(
                              username: controller
                                  .listPostingan[index].user!.username,
                              time: controller.listPostingan[index].createdAt
                                  .toString(),
                              postImagePath:
                                  "${Const.baseUrl}storage/${controller.listPostingan[index].foto}",
                              caption:
                                  controller.listPostingan[index].description,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
