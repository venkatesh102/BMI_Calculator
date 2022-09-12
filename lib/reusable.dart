import 'package:flutter/material.dart';
import 'package:practice/const.dart';
import 'const.dart';
import 'bottombutton.dart';
import 'dart:math';
import 'input.dart';
class icons extends StatelessWidget {
  icons({required this.coin, required this.label});
  final IconData coin;
  final Text label;
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        coin,
        size: 80.0,
      ),
      SizedBox(
        height: 10.0,
      ),
      label,
    ]);
  }
}

class reusablecard extends StatelessWidget {
  reusablecard(
      {required this.colour, required this.icon, required this.onPress});
  final Color colour;
  final Widget icon;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
          child: icon,
          //color: Colors.white,
          height: 200,
          width: 10,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), color: colour)),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPress});
  IconData icon;
  VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      elevation: 0.0,
      onPressed: onPress,
      child: Icon(icon),
      constraints: const BoxConstraints(minHeight: 56.0, minWidth: 56.0),
    );
  }
}

class ResultPage extends StatelessWidget {
  ResultPage({ required this.res, required this.val, required this.des});
  final String res;
  final String val;
  final String des;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(margin: EdgeInsets.all(15.0),alignment:Alignment.bottomLeft,
                child: Text(
                  'YOUR RESULT',
                  style: kTitletextstyle,
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: reusablecard(
                    colour: kActivecolor,
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [Text(res,style: kResulttextstyle,),Text(val,style: kResultnumstyle,),Text(textAlign: TextAlign.center,des,style: kResultsentencestyle,)],
                    ),
                    onPress: () {})),
                BottomPage(titlename: 'RE-CALCULATE', onTap: () {Navigator.pop(context);})
          ]),
    );
  }
}

class Result
{
  Result({required this.height,required this.weight});
  final int height;
  final int weight;

  double _bmi=0;

  String BMI(){
    _bmi=weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String getResult(){
    if(_bmi>=25){
      return 'Overweight';
    }
    else if(_bmi>18){
      return 'Normal';
    }
    else{
      return 'Underweight';
    }
  }
  String getDescription(){
    if(_bmi>=25){
      return 'You have higher than Normal body.Try to exercise';
    }
    else if(_bmi>18){
      return 'You have a normal body.Good job';
    }
    else{
      return 'You have low bmi then normal.You can eat much';
    }
  }

}
