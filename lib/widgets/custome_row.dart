import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikishaadmin/widgets/text_widget.dart';

class CustomeRow extends ConsumerWidget {
  const CustomeRow(
      {super.key,
      required this.imgurl,
      required this.qtytext,
      required this.titletext});
  final String imgurl;
  final InfoText titletext;
  final InfoText qtytext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 40,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  image: NetworkImage(imgurl), fit: BoxFit.cover)),
        ),
        Column(
          children: [titletext, qtytext],
        )
      ],
    );
  }
}
