import 'package:flutter/material.dart';
import '../utils/styles.dart';

class MainButton extends StatelessWidget {
  final double buttonHeight;
  final String buttonText;
  final VoidCallback? onTapHandler;
  const MainButton({
    Key? key,
    required this.buttonHeight,
    required this.buttonText,
    this.onTapHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapHandler,
      child: Container(
        height: buttonHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Styles.buttonColor,
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.all(20),
        child: Center(child: Text(buttonText, style: Styles.heading2)),
      ),
    );
  }
}
