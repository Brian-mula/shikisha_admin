import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  const InfoText({super.key, required this.text, this.textstyle});
  final String text;
  final TextStyle? textstyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textstyle ?? Theme.of(context).textTheme.headline6,
    );
  }
}
