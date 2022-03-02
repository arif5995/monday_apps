import 'package:flutter/material.dart';

class TextFormFieldCustom {
  static Widget TextFormFieldProfil(
      {TextEditingController? controller,
      Key? key,
      String? hint,
      TextInputType? inputTipe,
      int maxline = 1,
      double height = 55}) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: height,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            // BoxShadow(
            //     color: Colors.black26,
            //     offset: Offset(0, 1),
            //     blurRadius: 2,
            //     spreadRadius: 1),
          ]),
      child: TextFormField(
        key: key,
        maxLines: maxline,
        controller: controller,
        keyboardType: inputTipe,
        style: TextStyle(fontSize: 14),
        decoration: InputDecoration(hintText: hint, border: InputBorder.none),
      ),
    );
  }

  static Widget TextFormFieldAddBox(
      {TextEditingController? controller,
      Key? key,
      String? hint,
      TextInputType? inputTipe,
      int maxline = 1,
      double height = 55}) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: height,
      decoration: BoxDecoration(
          color: Color(0xFFC4C4C4),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            // BoxShadow(
            //     color: Colors.black26,
            //     offset: Offset(0, 1),
            //     blurRadius: 2,
            //     spreadRadius: 1),
          ]),
      child: TextFormField(
        key: key,
        maxLines: maxline,
        controller: controller,
        keyboardType: inputTipe,
        style: TextStyle(fontSize: 14),
        decoration: InputDecoration(hintText: hint, border: InputBorder.none),
      ),
    );
  }
}
