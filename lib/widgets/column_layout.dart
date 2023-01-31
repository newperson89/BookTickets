import 'package:delivery/utils/app_layout.dart';
import 'package:delivery/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppColumnLayout extends StatelessWidget {
  final CrossAxisAlignment alignment;
  final String firstText;
  final String secondText;
  final bool? isColor;
  const AppColumnLayout({Key? key, required this.firstText, required this.secondText, required this.alignment, this.isColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(firstText, style: isColor==null? Styles.headlineStyle3.copyWith(color: Colors.white): Styles.headlineStyle3,),
        Gap(AppLayout.getHeight(5)),
        Text(secondText, style: isColor==null? Styles.headlineStyle4.copyWith(color: Colors.white):Styles.headlineStyle4,),
      ],
    );
  }
}
