import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:todoapp/Controller/todo_controller.dart';
import 'package:todoapp/Model/todo.dart';
import 'package:todoapp/View/edit_task.dart';
import 'package:todoapp/View/home_page.dart';

class RemainingTaskCard extends StatelessWidget {
   //RemainingTaskCard({Key? key, required this.index, required this.title, required this.desc, required this.done}) : super(key: key);
   final TodoController controller = Get.find();
   RemainingTaskCard({required this.todo, required this.done});
   Todo todo;
   bool done;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          if(!done){
            Get.to(EditTask(todo:todo));
          }
        },
        onLongPress: (){
          Get.defaultDialog(title: "Dikkat",
              content: Text("Görevi silmek istediğinizden emin misiniz?"),
              onCancel:() {},
              textCancel: "Hayır",
              textConfirm: "Evet",
              onConfirm: () {
                controller.removeTodo(todo);
                controller.getDocuments();
                Future.delayed(Duration(milliseconds: 500),() {
                  Get.back();
                });
              }
          );
        },
        child: Container(
          height: Get.height*0.15,
          width: Get.width,
          decoration: BoxDecoration(
            color: Color(0xFFFAFCFD),
            borderRadius: BorderRadius.only(topRight: Radius.circular(26), topLeft: Radius.circular(26),
                bottomRight: Radius.circular(26)),
            boxShadow:   [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(1, 1), // Shadow position
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(todo.title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Color(0xFF262932)),),
                      SizedBox(height: 2,),
                      Expanded(
                        child: Text(todo.description, style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Color(0xFF262932)),),
                      ),
                    ],
                  ),
                ),
              ),
              done ? Container() : InkWell(
                onTap: () {
                  controller.toggleTodoStatus(todo);
                  controller.getDocuments();
                },
                child: Container(
                  height: Get.height,
                  width: Get.width*0.11,
                  decoration: const BoxDecoration(
                    color: Color(0xFF6CCFF6),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(26), bottomRight: Radius.circular(26)),
                  ),
                  child: Center(
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Text("TAMAMLA"),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
