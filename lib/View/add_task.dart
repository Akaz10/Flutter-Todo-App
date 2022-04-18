import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:todoapp/Controller/add_task_controller.dart';
import 'package:todoapp/Model/todo.dart';
import 'package:todoapp/Widgets/my_button.dart';
import 'package:todoapp/Widgets/my_text_field.dart';
import '../Controller/todo_controller.dart';

class AddTask extends StatelessWidget {
  AddTask({Key? key}) : super(key: key);
  final TodoController todoController = Get.find();

  @override
  Widget build(BuildContext context) {
    final AddTaskController controller = Get.put(AddTaskController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF262932),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                Icons.chevron_left,
                size: 38,
              ),
            )),
      ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Container(
                  height: Get.height,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: Color(0xFFE5EFF5),
                      borderRadius: BorderRadius.only(topRight: Radius.circular(70))
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 24, horizontal: 18),
                    child: Form(
                      key: controller.addTaskKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("GÖREV AYRINTISI EKLE", style: TextStyle(
                              color: Color(0xFF262932),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),),
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 20,horizontal: 8),
                            child: MyTextField(
                              title: "Görev başlığı giriniz",
                              controller: controller.taskTitle,
                              line: 1,
                              action: TextInputAction.next,
                              kbType: TextInputType.name,
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 20,horizontal: 8),
                            child: MyTextField(
                              title: "Görev açıklaması giriniz",
                              controller: controller.taskDescription,
                              line: 4,
                              action: TextInputAction.done,
                              kbType: TextInputType.name,
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 20,horizontal: 8),
                            child: MyButton(
                              title: "Görev Ekle",
                              width: Get.width-50,
                              height: Get.height*0.095,
                              onClick: () async{
                                if(controller.addTaskKey.currentState!.validate()){
                                  debugPrint("Gerekli İşlemleri Yap");
                                  controller.addTaskKey.currentState!.save();
                                  final todo = Todo(
                                    id: DateTime.now().toString(),
                                    title: controller.taskTitle.text,
                                    description: controller.taskDescription.text,
                                    isDone: false,
                                  );
                                  todoController.addTodo(todo);
                                  todoController.getDocuments();
                                  Future.delayed(Duration(milliseconds: 500),() {
                                    Get.back();
                                  });
                                }
                              },
                            )
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
