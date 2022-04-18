import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    required this.title,
    required this.controller,
    required this.line,
    required this.action,
    required this.kbType,
  });
  String title;
  var controller;
  int line;
  var action;
  var kbType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "Bu Kısımları Boş Geçemezsiniz";
          } else {
            return null;
          }
        },
        controller: controller,
        textInputAction: action,
        decoration: InputDecoration(
          hintText: title,
          hintStyle: const TextStyle(
            color: Colors.black54,
          ),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0x00000000),
                width: 1,
              ),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(26),
                  topLeft: Radius.circular(26),
                  bottomRight: Radius.circular(26))),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0x00000000),
                width: 1,
              ),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          filled: true,
          fillColor: Colors.white,
        ),
        style: const TextStyle(
          color: Color(0xFF262932),
        ),
        maxLines: line,
        keyboardType: kbType
        );
  }
}
