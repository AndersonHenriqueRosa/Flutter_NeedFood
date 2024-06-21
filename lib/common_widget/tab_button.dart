import 'package:flutter/material.dart';
import 'package:need_food/common/my_colors.dart';

class TabButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String icon;
  final bool isSelected;
  const TabButton({super.key, required this.title, required this.icon, required this.onTap, required this.isSelected});
  

  @override
  Widget build(BuildContext context) {
    return InkWell(
              onTap: onTap,
              focusColor: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Image.asset(
                      icon,
                      width: 15,
                      height: 15,
                      color: isSelected ? MyColors.buttonColor : MyColors.placeholder,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                      color: isSelected ?MyColors.buttonColor : MyColors.placeholder, 
                      fontSize: 12, 
                      fontWeight: FontWeight.w500,
                      ),
                    )
                 ],
              ),
      );
  }
}