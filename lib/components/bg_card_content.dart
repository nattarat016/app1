import 'package:flutter/material.dart';

class BgCardContent extends StatelessWidget {
  final IconData icon;
  final double iconSize = 60 ;
  final String textLabel;
  final Color color;

  const BgCardContent({
    super.key, required this.icon, required this.textLabel, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        Icon(
          icon,
          size: iconSize,
          color: color,
        ),
         Text(textLabel)
      ],
    );
  }
}
