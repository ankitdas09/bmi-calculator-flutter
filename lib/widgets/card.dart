import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Color color;
  final Widget? cardChild;
  final Function? onTapHandler;
  const CardContainer({
    Key? key,
    required this.color,
    this.cardChild,
    this.onTapHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapHandler == null ? null : () => onTapHandler!(),
      child: (Container(
        height: 190,
        width: double.infinity,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: cardChild,
      )),
    );
  }
}
