import 'dart:core';
import 'dart:math';


class  Cal {
   Cal({required this.height, required this.weight, required this.age});
   final int height;
   final int weight;
   final int age;
   double _bmi= 0.0;


   String bmiValue(){
       _bmi  = (weight/pow(height/100,2));
      return _bmi.toStringAsFixed(1);
   }

   String type(){
      if (_bmi >= 25.0) {
         return 'Overweight';
      } else if (_bmi > 18.5) {
         return 'Normal';
      } else {
         return 'Underweight';
      }
   }

   String comment(){
      if (_bmi >= 25.0) {
         return 'You have a higher than normal body weight.\n\nTry to exercise more.';
      } else if (_bmi >= 18.5) {
         return 'You have a normal body weight.\n\nGood job!';
      } else {
         return 'You have a lower than normal body weight. \n\nYou can eat a bit more.';
      }
   }
}