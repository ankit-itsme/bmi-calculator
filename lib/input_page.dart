import 'package:flutter/material.dart';
import 'constants.dart';
import 'icon_data.dart';
import 'reusable_card.dart';
import 'round_button.dart';
import 'result_page.dart';
import 'bottom_text.dart';
import 'app_brain.dart';
import 'teenPage.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 160;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: ListView(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ReusabelCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                    color: selectedGender == Gender.Male
                        ? kActiveColor
                        : kDeActiveColor,
                    cardChild: Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: IconDataCard(
                        iconWidget: (Icons.male),
                        lebel: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusabelCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.Female;
                      });
                    },
                    color: selectedGender == Gender.Female
                        ? kActiveColor
                        : kDeActiveColor,
                    cardChild: Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: IconDataCard(
                        iconWidget: (Icons.female),
                        lebel: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusabelCard(
              color: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text(
                      'HEIGHT',
                      style: kLevelTextStyle,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kLargeTextStyle),
                      Text(
                        'cm',
                        style: kUnitTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      overlayColor: Colors.pink[200],
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 26),
                    ),
                    child: Slider(
                      thumbColor: Colors.pink,
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      min: 100.0,
                      max: 220.0,
                      activeColor: kActiveColor,
                      inactiveColor: kDeActiveColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusabelCard(
                    color: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Text(
                            'WEIGHT',
                            style: kLevelTextStyle,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: kLargeTextStyle,
                            ),
                            Text(
                              'kg',
                              style: kUnitTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundButton(
                              onPressed: () {
                                setState(() {
                                  weight > 0 ? weight-- : weight;
                                });
                              },
                              icon: Icons.remove,
                            ),
                            RoundButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: Icons.add,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusabelCard(
                    color: kActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Text(
                            'AGE',
                            style: kLevelTextStyle,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              age.toString(),
                              style: kLargeTextStyle,
                            ),
                            Text(
                              'yr',
                              style: kUnitTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundButton(
                              onPressed: () {
                                setState(() {
                                  age > 0 ? age-- : age;
                                });
                              },
                              icon: Icons.remove,
                            ),
                            RoundButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: Icons.add,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomText(
            instruction: 'CALCULATE',
            onPress: () {
              Cal cal = Cal(height: height, weight: weight, age: age);

              if (age >= 20) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              type: cal.type(),
                              bmiValue: cal.bmiValue(),
                              comment: cal.comment(),
                            )));
              } else {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('WARNING!',),
                    titleTextStyle:TextStyle(fontSize: 28, color: Colors.red),
                    backgroundColor: Colors.white,
                    elevation: 10,
                    content: Text(
                      'No data is available for teenager.\n\nproceed if you want to calculate as adult rules.',
                      // style: TextStyle(
                      //     fontSize: 18,
                      //     fontWeight: FontWeight.w500,
                      //     color: Colors.white38),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResultPage(
                                          type: cal.type(),
                                          bmiValue: cal.bmiValue(),
                                          comment: cal.comment(),
                                        )));
                          },
                          child: Text(
                            'PROCEED',
                            // style: TextStyle(
                            //     color: Colors.white,
                            //     fontWeight: FontWeight.w700,
                            //     fontSize: 26),
                          ))
                    ],
                  ),
                );
              }
            },
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
