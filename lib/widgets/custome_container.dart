import 'package:flutter/material.dart';

class CustomeContainer extends StatelessWidget {
  const CustomeContainer({super.key, this.color, required this.widget});
  final Color? color;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color ?? Colors.blue.shade50),
      child: widget,
    );
  }
}
