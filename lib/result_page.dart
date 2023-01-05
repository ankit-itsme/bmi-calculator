import 'package:flutter/material.dart';
import 'input_page.dart';
import 'constants.dart';
import 'bottom_text.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({required this.type, required this.bmiValue, required this.comment}) ;
  final String type;
  final String bmiValue;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 5, left: 12),
            child: Text(
              'YOUR RESULT',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 36),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0, left: 12),
              child: Container(
                decoration: BoxDecoration(
                    color: kActiveColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      type,
                      style: TextStyle(
                          color: Colors.cyanAccent,
                          fontWeight: FontWeight.w700,
                          fontSize: 28),
                    ),
                    Text(
                      bmiValue,
                      style: kLargeTextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80.0),
                      child: Text(
                        comment,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          BottomText(
              instruction: 'RE-CALCULATE',
              onPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InputPage()));
              })
        ],
      ),
    );
  }
}
