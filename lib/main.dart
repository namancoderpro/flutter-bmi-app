import 'package:flutter/material.dart';
import 'package:bmi_app/pages/bmi_result.dart';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/': (context) => bmiResult(),
      '/home': (context) => bmiApp(),
    },
  ));
}

class bmiApp extends StatefulWidget {
  bmiApp({Key? key}) : super(key: key);

  @override
  bmiAppState createState() => bmiAppState();
}

class bmiAppState extends State<bmiApp> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double? bmiResultvar;
  String? resultText;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 10, 10),
              child: Text(
                "Let's Calculate Your Current BMI",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade700,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
              child: Text(
                "You can find out whether you are underweight, overweight, or ideal weight",
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            Form(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextFormField(
                      controller: heightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: 'Enter your height (in meter)'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: weightController,
                      decoration: InputDecoration(
                          hintText: 'Enter your weight (in kgs)'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: ButtonTheme(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(400, 50),
                          ),
                          child: Text('Calculate My BMI'),
                          onPressed: () {
                            double h = double.parse(heightController.text);
                            double w = double.parse(weightController.text);
                            setState(() {
                              bmiResultvar = w / (h * h);
                              if (bmiResultvar! > 25 && bmiResultvar! < 30) {
                                resultText =
                                    "You're overweight. You need to take action. Four things you can do are: \n 1. Do not skip breakfast \n 2. Drink plenty of water \n 3. Do not stock junk food \n 4. Do more exercise";
                              } else if (bmiResultvar! < 18.5) {
                                resultText =
                                    "You are underweight. Some tips from us would be: \n 1. Add high-protein and whole-grain carbohydrate snacks \n 2. Eat several small meals a day.";
                              } else if (bmiResultvar! >= 30) {
                                resultText =
                                    "You're obese. Start working on yourself quickly. Some tips to follow are: \n 1. Make a healthy eating plan and do regular physical activity. \n 2. Eating slowly and only when hungry \n 3. Make sure that you get a good, deep sleep";
                              } else if (bmiResultvar! > 18.5 &&
                                  bmiResultvar! < 25) {
                                resultText = "You're perfectly fine! Good job! Keep it up.";
                              }
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => bmiResult(
                                        feedbackText: resultText,
                                        bmi: bmiResultvar
                                            ?.toStringAsFixed(1)
                                            .toString(),
                                      )));
                            });
                          }),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
