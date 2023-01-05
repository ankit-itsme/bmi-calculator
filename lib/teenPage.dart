import 'package:flutter/material.dart';
import 'app_brain.dart';
import 'result_page.dart';
import 'input_page.dart';
import 'constants.dart';
import 'bottom_text.dart';

class TeenPage extends StatelessWidget {
  const TeenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI FOR TEENAGER'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('BMI INTERPRETATION UNDER AGE OF 20 YEARS IS UNAVAILABLE RIGHT NOW.', style: kBottomTextStyle,),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('Click on below button to check according to adult interpretation.', style: kLevelTextStyle,),
          ),
          BottomText(
              instruction: 'ANYWAY CALCULATE',
              onPress: (){},
          )
        ],
      ),
    );
  }
}
