import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable.dart';
import 'const.dart';
import 'bottombutton.dart';

class input extends StatefulWidget {
  const input({Key? key}) : super(key: key);

  @override
  State<input> createState() => _inputState();
}

enum gende { male, female, none }

class _inputState extends State<input> {
  gende selectgender = gende.none;
  int heightcount = 180;
  int weight = 1;
  int age = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('                 BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(children: [
              Expanded(
                  child: reusablecard(
                onPress: () {
                  setState(() {
                    selectgender = gende.male;
                  });
                },
                colour:
                    selectgender == gende.male ? kActivecolor : kInactivecolor,
                icon: icons(coin: FontAwesomeIcons.mars, label: Text('MALE')),
              )),
              Expanded(
                  child: reusablecard(
                onPress: () {
                  setState(() {
                    selectgender = gende.female;
                  });
                },
                colour: selectgender == gende.female
                    ? kActivecolor
                    : kInactivecolor,
                icon: icons(
                  coin: FontAwesomeIcons.venus,
                  label: Text('FEMALE'),
                ),
              ))
            ])),
            Expanded(
              child: Row(children: [
                Expanded(
                  child: reusablecard(
                    onPress: () {
                      setState(() {
                        selectgender = gende.male;
                      });
                    },
                    colour: kActivecolor,
                    icon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'HEIGHT',
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                heightcount.toString(),
                                style: kNumbertextstyle,
                              ),
                              Text(
                                'cm',
                                style: kLabeltextstyle,
                              )
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbColor: Color(0xFFEB1555),
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.white12,
                              overlayColor: Color(0xFFB1555),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 10.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30.0),
                            ),
                            child: Slider(
                              value: heightcount.toDouble(),
                              min: 120.0,
                              max: 210.0,
                              //activeColor: Colors.red,
                              //inactiveColor: Colors.white12,
                              onChanged: (double value) {
                                setState(() {
                                  heightcount = value.toInt();
                                });
                              },
                            ),
                          )
                        ]),
                  ),
                )
              ]),
            ),
            Expanded(
                child: Row(children: [
              Expanded(
                  child: reusablecard(
                      onPress: () {
                        setState(() {
                          selectgender = gende.male;
                        });
                      },
                      colour: kActivecolor,
                      icon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kLabeltextstyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumbertextstyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPress: () {
                                    setState(() {
                                      if (weight > 0) {
                                        weight--;
                                      }
                                    });
                                  }),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ))),
              Expanded(
                  child: reusablecard(
                      onPress: () {
                        setState(() {
                          selectgender = gende.male;
                        });
                      },
                      colour: kActivecolor,
                      icon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kLabeltextstyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumbertextstyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPress: () {
                                    setState(() {
                                      if (age > 0) {
                                        age--;
                                      }
                                    });
                                  }),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      )))
            ])),
            BottomPage(
                titlename: 'CALCULATE',
                onTap: () {

                  Result cal=Result(height: heightcount, weight: weight);
                  String val=cal.BMI();
                  String res=cal.getResult();
                  String des=cal.getDescription();
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ResultPage(res: res, val: val, des: des)));
                  });
                })
          ],
        ));
  }
}
