import 'dart:convert';

import 'package:get/get.dart';
import 'package:getxjsonencode/models/album_model.dart';
import 'package:http/http.dart' as http;

class Controller extends GetxController {
  var photoList = <AlbumModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAlbumData();
  }

  Future<void> fetchAlbumData() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos/2"));

    if (response.statusCode == 200) {
      AlbumModel _albumModel = AlbumModel.fromJson(jsonDecode(response.body));
      photoList.add(
        AlbumModel(
          title: _albumModel.title,
          url: _albumModel.url,
          thumbnailUrl: _albumModel.thumbnailUrl,
          id: _albumModel.id,
          albumId: _albumModel.albumId,
        ),
      );
      isLoading.value = false;
    } else {
      Get.snackbar(
          'Error Loading Data',
          "Server responded: ${response.statusCode} : "
              "${response.reasonPhrase.toString()}"
              " ");
    }
  }
}
