import 'package:flutter/material.dart';
import 'package:flutterbmicalculator/constants/colors.dart';
import 'package:hexcolor/hexcolor.dart';

class RightBar extends StatelessWidget {
  const RightBar({super.key, required this.barWidth});
  final double barWidth;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 25,
          width: barWidth,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20)
            ),
            color: HexColor(primaryColor)
          ),
        )
      ],
    );
  }
}