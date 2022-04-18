import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'package:intl/intl.dart';
import 'package:todoapp/Controller/todo_controller.dart';
import 'package:todoapp/Widgets/remaining_task_card.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'add_task.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final TodoController controller = Get.put(TodoController());
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(6.0),
        child: SizedBox(
          width: 70,
          height: 70,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                Get.to(AddTask());
              },
              backgroundColor: Color(0xFF6CCFF6),
              child: const Icon(
                Icons.add,
                size: 32,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.all(14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat("dd/MM/yyy").format(controller.date.value).toString(),
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          DateFormat('EEEEE', 'tr_TR').format(controller.date.value),
                        style: TextStyle(
                            color: Colors.white54,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.calendar_today_rounded,
                    color: Color(0xFF6CCFF6),
                    size: 36,
                  )
                ],
              ),
            ),
            Container(
              //height: Get.height,
              width: Get.width,
              decoration: BoxDecoration(
                  color: Color(0xFFE5EFF5),
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(70))),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "YAPILACAK GÖREVLER",
                      style: TextStyle(
                          color: Color(0xFF262932),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                      child: Obx(() => controller.todos.length == 0
                          ? Text("Yapılacak Görev Bulunmamakta",
                              style: TextStyle(
                                  color: Color(0xFF262932),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400))
                          : ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.todos.length,
                              itemBuilder: (context, index) {
                                return RemainingTaskCard(
                                    todo: controller.todos[index], done: false);
                              },
                            )),
                    ),
                    Text(
                      "TAMAMLANAN GÖREVLER",
                      style: TextStyle(
                          color: Color(0xFF262932),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                      child: Obx(() => controller.todosCompleted.length == 0
                          ? Text("Tamamlanan Görev Bulunmamakta",
                          style: TextStyle(
                              color: Color(0xFF262932),
                              fontSize: 16,
                              fontWeight: FontWeight.w400))
                          :  ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.todosCompleted.length,
                            itemBuilder: (context, index) {
                              return RemainingTaskCard(
                                  todo: controller.todosCompleted[index],
                                  done: true);
                            },
                          )),
                    ),
                    controller.todosCompleted.isEmpty ? SizedBox(height: Get.height*0.6,) : Container(height: 180,),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
