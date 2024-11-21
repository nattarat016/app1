import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
    final IconData icon;
    final VoidCallback callback;
  const CircleButton({
    super.key, required this.icon, required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: callback,
        style: ButtonStyle(
            shape:
                WidgetStateProperty.all(const CircleBorder()),
            backgroundColor: WidgetStateProperty.all(
                const Color(0xff4c4f5e))),
        child: Icon(icon));
  }
}
