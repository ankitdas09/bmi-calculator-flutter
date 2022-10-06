import 'package:flutter/material.dart';
import '../utils/styles.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback handler;
  const RoundIconButton({
    Key? key,
    required this.icon,
    required this.handler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: handler,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: Styles.roundIconBackgroundColor,
      child: Icon(icon),
    );
  }
}
