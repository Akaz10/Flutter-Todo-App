import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditTaskController extends GetxController{
  final GlobalKey<FormState> editTaskKey = GlobalKey<FormState>();
  late TextEditingController taskTitle, taskDescription;

  @override
  void onInit() {
    super.onInit();
    taskTitle = TextEditingController();
    taskDescription = TextEditingController();
  }
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    taskTitle.dispose();
    taskDescription.dispose();
    super.onClose();
  }

}