import 'package:bmi_calculator/widgets/mainButton.dart';
import 'package:flutter/material.dart';
import '../utils/styles.dart';
import '../widgets/card.dart';

class ResultsPage extends StatelessWidget {
  final String bmiVal;
  final String resultText;
  final String interpretation;
  const ResultsPage({
    Key? key,
    required this.bmiVal,
    required this.resultText,
    required this.interpretation,
  }) : super(key: key);

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
                  cardChild: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          resultText.toUpperCase(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.greenAccent,
                          ),
                        ),
                        Text(
                          bmiVal,
                          style: Styles.heading6,
                        ),
                        Text(
                          interpretation,
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
