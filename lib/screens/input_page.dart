import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/utils/calculator_brain.dart';
import 'package:bmi_calculator/utils/styles.dart';
import 'package:bmi_calculator/widgets/card.dart';
import 'package:bmi_calculator/widgets/icon_content.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/round_icon_button.dart';

const bottomButtonHeight = 60.0;

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = Styles.inactiveCardColor;
  Color femaleCardColor = Styles.inactiveCardColor;

  int height = 180;
  int weight = 60;
  int age = 18;

  void updateColor(Gender gender) {
    if (gender == Gender.male) {
      maleCardColor = maleCardColor == Styles.inactiveCardColor
          ? Styles.activeCardColor
          : Styles.inactiveCardColor;
      femaleCardColor = Styles.inactiveCardColor;
    } else if (gender == Gender.female) {
      femaleCardColor = femaleCardColor == Styles.inactiveCardColor
          ? Styles.activeCardColor
          : Styles.inactiveCardColor;
      maleCardColor = Styles.inactiveCardColor;
    }
    setState(() {
      maleCardColor;
      femaleCardColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI Calculator')),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CardContainer(
                      onTapHandler: () => updateColor(Gender.male),
                      color: maleCardColor,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: CardContainer(
                      onTapHandler: () => updateColor(Gender.female),
                      color: femaleCardColor,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CardContainer(
                      color: Styles.bgColor,
                      cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'HEIGHT',
                              style: Styles.heading1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  height.toString(),
                                  style: Styles.heading6,
                                ),
                                Text(
                                  'cm',
                                  style: Styles.heading1,
                                ),
                              ],
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                activeTrackColor: Colors.white,
                                inactiveTrackColor: const Color(0xFF8D8E98),
                                overlayColor: const Color(0x29EB1555),
                                thumbColor: const Color(0xFFEB1555),
                                thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 15,
                                ),
                                overlayShape: const RoundSliderOverlayShape(
                                  overlayRadius: 30,
                                ),
                              ),
                              child: Slider(
                                value: height.toDouble(),
                                min: 120,
                                max: 220,
                                onChanged: (double newValue) {
                                  setState(() {
                                    height = newValue.round();
                                  });
                                },
                                // activeColor: const Color(0xFFEB1555),
                              ),
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CardContainer(
                      color: Styles.bgColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: Styles.heading1,
                          ),
                          Text(
                            weight.toString(),
                            style: Styles.heading6,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                handler: () {
                                  if (weight > 1) {
                                    setState(() {
                                      weight -= 1;
                                    });
                                  }
                                },
                              ),
                              const SizedBox(
                                width: 12.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                handler: () {
                                  if (weight < 200) {
                                    setState(() {
                                      weight += 1;
                                    });
                                  }
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CardContainer(
                      color: Styles.bgColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: Styles.heading1,
                          ),
                          Text(
                            age.toString(),
                            style: Styles.heading6,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                handler: () {
                                  if (age > 1) {
                                    setState(() {
                                      age -= 1;
                                    });
                                  }
                                },
                              ),
                              const SizedBox(
                                width: 12.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                handler: () {
                                  if (age < 120) {
                                    setState(() {
                                      age += 1;
                                    });
                                  }
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(weight: weight, height: height);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                        bmiVal: calc.bmi(),
                        resultText: calc.getResults(),
                        interpretation: calc.getInterpretation()),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.only(bottom: 5),
                height: bottomButtonHeight,
                margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
                decoration: BoxDecoration(
                  color: Styles.buttonColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'Calculate',
                    style: Styles.heading2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
