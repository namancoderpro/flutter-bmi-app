import 'package:flutter/material.dart';
import 'package:bmi_app/main.dart';

class bmiResult extends StatefulWidget {
  String? bmi;
  String? feedbackText;

  bmiResult({this.bmi, this.feedbackText});

  @override
  _bmiResultState createState() => _bmiResultState();
}

class _bmiResultState extends State<bmiResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    width: 350,
                    height: 440,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 10,
                          offset: Offset(8, 8), // Shadow position
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                          child: Text(
                            'Your BMI is',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Text(
                            '${widget.bmi}',
                            style: TextStyle(
                                fontSize: 80,
                                fontWeight: FontWeight.bold,
                                color: Colors.green.shade600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 50),
                          child: Text(
                            '${widget.feedbackText}',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.restart_alt),
                label: Text('Start Over'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
