import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxjsonencode/controllers/controller.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<Controller>(Controller());
  }
}
