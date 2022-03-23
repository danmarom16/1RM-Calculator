import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'top_small_card_data.dart';
import 'constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color deadliftColor = inactiveCardColor;
  Color squatColor = inactiveCardColor;
  Color benchColor = inactiveCardColor;

  double weight = 21.0;

  void toggleDeadliftOn() {
    setState(() {
      deadliftColor = activeCardColor;
      squatColor = inactiveCardColor;
      benchColor = inactiveCardColor;
    });
  }

  void toggleSquatOn() {
    setState(() {
      squatColor = activeCardColor;
      deadliftColor = inactiveCardColor;
      benchColor = inactiveCardColor;
    });
  }

  void toggleBenchOn() {
    setState(() {
      benchColor = activeCardColor;
      deadliftColor = inactiveCardColor;
      squatColor = inactiveCardColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('1RM Calculator')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        toggleDeadliftOn();
                      });
                    },
                    color: deadliftColor,
                    child: TopSmallCardsData(
                      imagePath: 'images/deadlift.png',
                      text: 'DEADLIFT',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          toggleSquatOn();
                        });
                      },
                      color: squatColor,
                      child: TopSmallCardsData(
                        imagePath: 'images/squat.png',
                        text: 'SQUAT',
                      )),
                ),
                Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          toggleBenchOn();
                        });
                      },
                      color: benchColor,
                      child: TopSmallCardsData(
                        imagePath: 'images/bench_press.png',
                        text: 'BENCH',
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: activeCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'WEIGHT',
                    style: headingsTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        weight.toStringAsFixed(1),
                        style: numbersTextStyle,
                      ),
                      Text(
                        'kg',
                        style: headingsTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                      min: 20.0,
                      max: 200.0,
                      value: weight.roundToDouble(),
                      activeColor: turquoise,
                      inactiveColor: textColor,
                      onChanged: (double newValue) {
                        setState(() {
                          this.weight = newValue;
                        });
                      }),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: activeCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: activeCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            color: turquoise,
            height: 60.0,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
