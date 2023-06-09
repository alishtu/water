import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watercontr/constants.dart';
import 'package:watercontr/control.dart';
import 'package:watercontr/brain.dart';
import 'reusable_card.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.value,
        required this.result,
        required this.interpretation,
        required this.water});
  final String value;
  final String result;
  final String interpretation;
  final String water;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Water Control'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'YOUR DAILY NORM',
                  style: kResultHeadingStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: Color(0xff332d3b),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      result,
                      style: kResultTextStyle,
                    ),
                    Text(
                      value,
                      style: kBMI,
                    ),
                    Text(
                      water,
                      style: kResultTextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SubmitWidget(
              submit: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WaterControlApp(
                    ),
                  ),
                );
              },
              submissionText: 'Tap to Control',
            )
          ],
        ),
      ),
    );
  }
}
