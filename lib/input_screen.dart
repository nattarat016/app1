import 'package:app1/circle_button.dart';
import 'package:app1/components/bg_card.dart';
import 'package:app1/components/bg_card_content.dart';
import 'package:app1/constants.dart';
import 'package:app1/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  var maleCardColor = kInActiveColor;
  var femaleCardcolor = kActiveColor;
  var inputHeight = 183;
  var inputWeight = 80;
  var inputAge = 18;

  void updateAge(int value) {
    inputAge += value;
  }

  void updateWeight(int value) {
    inputWeight += value;
  }

  void toggleGenderCard() {
    var colorHolder = maleCardColor;
    maleCardColor = femaleCardcolor;
    femaleCardcolor = colorHolder;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('W5'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BgCard(
                    callback: () {
                      setState(() {
                        toggleGenderCard();
                      });
                    },
                    child: BgCardContent(
                      icon: FontAwesomeIcons.mars,
                      textLabel: 'Male',
                      color: maleCardColor,
                    ),
                  ),
                ),
                Expanded(
                  child: BgCard(
                    callback: () => setState(() => toggleGenderCard()),
                    child: BgCardContent(
                        icon: FontAwesomeIcons.venus,
                        textLabel: 'Female',
                        color: femaleCardcolor),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(children: [
              Expanded(
                child: BgCard(
                  callback: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Height'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(inputHeight.toString(), style: kNumberTextStyle),
                          const Text('cm')
                        ],
                      ),
                      Expanded(
                          child: Slider(
                              value: inputHeight.toDouble(),
                              max: 250,
                              min: 50,
                              activeColor: const Color(0xffeb1555),
                              onChanged: (value) {
                                setState(() {
                                  inputHeight = value.toInt();
                                });
                              }))
                    ],
                  ),
                ),
              )
            ]),
          ),
          Row(
            children: [
              Expanded(
                child: BgCard(
                  callback: () {},
                  child: Column(
                    children: [
                      const Text(
                        'Weight',
                        style: kLabelNumberTextStyle,
                      ),
                      Text(
                        inputWeight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleButton(
                            icon: FontAwesomeIcons.plus,
                            callback: () => setState(() {
                              updateWeight(1);
                            }),
                          ),
                          CircleButton(
                              icon: FontAwesomeIcons.minus,
                              callback: () => setState(() {
                                    updateWeight(-1);
                                  }))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: BgCard(
                  callback: () {},
                  child: Column(
                    children: [
                      const Text(
                        'Age',
                        style: kLabelNumberTextStyle,
                      ),
                      Text(
                        inputAge.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleButton(
                            icon: FontAwesomeIcons.plus,
                            callback: () => setState(() {
                              updateAge(1);
                            }),
                          ),
                          CircleButton(
                              icon: FontAwesomeIcons.minus,
                              callback: () => setState(() {
                                    updateAge(-1);
                                  }))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 100,
            color: Colors.pink,
            margin:  const EdgeInsets.only(top: 10),
            child: TextButton(onPressed: () {
              Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) =>  ResultScreen(weightKg: inputWeight, heightCm: inputHeight,)));
              }, child:  const Text('Calculate your BMI'),),
          )
        ],
      ),
    );
  }
}
