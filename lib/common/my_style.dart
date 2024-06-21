import 'package:flutter/material.dart';
import 'package:need_food/common/my_colors.dart';

class MyStyle{

  static TextStyle boldTextFeilStyle() {
    return const TextStyle(
                color: Colors.black, 
                fontSize: 24, 
                fontWeight: FontWeight.bold, 
                fontFamily: 'Montserrat');
  }

  static TextStyle headlineTextFeilStyle() {
    return const TextStyle(
                color: Colors.black, 
                fontSize: 18, 
                fontWeight: FontWeight.bold, 
                fontFamily: 'Poppins');
  }

  static TextStyle categoriesTextFeilStyle() {
    return const TextStyle(
                color: Colors.black, 
                fontSize: 14, 
                fontWeight: FontWeight.bold, 
                fontFamily: 'Poppins');
  }

  static TextStyle priceTextFeilStyle() {
    return const TextStyle(
                color: Colors.black, 
                fontSize: 18, 
                fontWeight: FontWeight.bold, 
                fontFamily: 'Poppins');
  }

  static TextStyle lightTextFeilStyle() {
    return const TextStyle(
                color: MyColors.grayText, 
                fontSize: 14, 
                fontWeight: FontWeight.w500, 
                fontFamily: 'Poppins');
  }
}