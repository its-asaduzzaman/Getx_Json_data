import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxjsonencode/controllers/controller.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<Controller>();
    return Scaffold(
      body: Obx(
        () => _controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("AlbumId: ${_controller.photoList[0].albumId}"),
                    Text("Id: ${_controller.photoList[0].id}"),
                    Text("title:${_controller.photoList[0].title}"),
                    Image.network(_controller.photoList[0].thumbnailUrl),
                    //  image ll be shown here
                  ],
                ),
              ),
      ),
    );
  }
}
