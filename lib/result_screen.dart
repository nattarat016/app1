import 'package:app1/bmi.dart';
import 'package:app1/components/bg_card.dart';
import 'package:app1/constants.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int weightKg;
  final int heightCm;
  const ResultScreen({super.key, required this.weightKg, required this.heightCm});

  @override
  Widget build(BuildContext context) {
    var (bmi, catagory) = Bmi.calculate(heightCm: heightCm, weightKg: weightKg);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Your result',
              style: kLabelNumberTextStyle,
            ),
          ),
          Expanded(
              flex: 12,
              child: BgCard(
                callback: () {},
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                        child: Text(
                      catagory,
                      style:  const TextStyle(color: Colors.green, fontSize: 30),
                    )),
                     Center(child: Text(bmi.toStringAsFixed(1),style: kNumberTextStyle,)),
                     const Center(
                        child: Text(
                      'You have a normal weight, Good job!',
                      style: TextStyle(fontSize: 17),
                    )),
                  ],
                ),
              )),
          SizedBox(
            width: double.infinity,
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(const Color(0xffeb1555)),
                    minimumSize: WidgetStateProperty.all(
                        const Size(double.infinity, 80))),
                child: const Text(
                  'Re-Calculate BMI',
                  style: kLabelNumberTextStyle,
                )),
          ),
        ],
      ),
    );
  }
}
