import 'package:flutter/material.dart';
import 'package:flutterbmicalculator/constants/colors.dart';
import 'package:hexcolor/hexcolor.dart';

class LeftBar extends StatelessWidget {
  const LeftBar({super.key, required this.barWidth});
  final double barWidth;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 25,
          width: barWidth,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20)
            ),
            color: HexColor(primaryColor)
          ),
        )
      ],
    );
  }
}