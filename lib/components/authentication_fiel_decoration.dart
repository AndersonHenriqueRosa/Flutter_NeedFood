import "package:flutter/material.dart";
import "package:need_food/common/my_colors.dart";

InputDecoration getAuthenticationInputDecoration(String label){
  return InputDecoration(
    hintText: label,
    fillColor: MyColors.grayBox,
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: MyColors.borderColor, width: 3), 
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.red, width: 3), 
      ),
      focusedErrorBorder: OutlineInputBorder(
       borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.red, width: 3),  
      ),
  );
}