import 'package:flutter/material.dart';
import 'package:task_management/common/utils/constants.dart';
import 'package:task_management/common/widgets/appstyle.dart';
import 'package:task_management/common/widgets/height_spacer.dart';
import 'package:task_management/common/widgets/reusable_text.dart';

class CustomOtnBtn extends StatelessWidget {
  const CustomOtnBtn(
      {Key? key,
      this.onTap,
      required this.width,
      required this.height,
      required this.color,
      this.color2,
      required this.text})
      : super(key: key);

  final void Function()? onTap;
  final double width;
  final double height;
  final Color color;
  final Color? color2;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color2,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(width: 1, color: color),
        ),
        child: Center(
          child: ReusableText(text: text, style: appstyle(18, color, FontWeight.bold)),
        ),
      ),
    );
  }
}
