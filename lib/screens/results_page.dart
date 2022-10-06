import 'package:bmi_calculator/widgets/mainButton.dart';
import 'package:flutter/material.dart';
import '../utils/styles.dart';
import '../widgets/card.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('BMI Calculator')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Your Result',
              style: Styles.heading6,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 40),
                child: CardContainer(
                  color: Styles.activeCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Normal Weight',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        '25.6',
                        style: Styles.heading6,
                      ),
                      Text(
                        'You have a normal body weight.',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            MainButton(
              buttonHeight: 60,
              buttonText: 'Calculate Again',
              onTapHandler: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
