import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChipItem extends StatelessWidget {
  Function onTap;
  bool isSelected;
  String title;
  Color borderColor;
  Color bg;
  Color textColor;

  ChipItem({
    super.key,
    required this.onTap,
    required this.title,
    required this.isSelected,
    required this.borderColor,
    required this.bg,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(37),
          border: Border.all(color: borderColor),
          color: bg
          // color: isSelected ? Colors.blue : Colors.transparent,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            // color: isSelected ? Colors.white : Colors.blue,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
