import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class MyButton extends StatelessWidget {
  String title;
  Function onClick;
  double width;
  double height;

  MyButton({required this.title,required this.onClick,required this.width,required this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 40),
      child: InkWell(
        onTap:() => onClick(),
        child: Container(
          width: width,//110,
          height: height,//50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(26), topLeft: Radius.circular(26),
                bottomRight: Radius.circular(26)),
            color: Color(0xFF6CCFF6),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: Color(0xFF262932),fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}