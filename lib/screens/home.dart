import 'package:flutter/material.dart';
import 'package:flutterbmicalculator/constants/colors.dart';
import 'package:flutterbmicalculator/widgets/left.dart';
import 'package:flutterbmicalculator/widgets/right.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _result = "";
  final heightController = TextEditingController();
  final massController = TextEditingController();
  double _value = 0;

  calculate() {
    FocusManager.instance.primaryFocus?.unfocus();
    double height = double.parse(heightController.text);
    double mass = double.parse(massController.text);

    double bmi = (mass / height / height) * 10000;

    if (bmi < 18.4) {
      setState(() {
        _result = "Underweight";
        _value = bmi;
      });
    } else if (bmi > 18.4 && bmi < 24.9) {
      setState(() {
        _result = "Normal weight";
        _value = bmi;
      });
    } else if (bmi > 24.9 && bmi < 39.9) {
      setState(() {
        _result = "Overweight";
        _value = bmi;
      });
    } else {
      setState(() {
        _result = "Obese";
        _value = bmi;
      });
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(mainColor),
          body: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "BMI Calculator",
                    style: TextStyle(
                      color: HexColor(primaryColor),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 130,
                    child: TextField(
                      controller: heightController,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Height",
                          hintStyle: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w300,
                              color: Colors.white.withOpacity(.8))),
                    ),
                  ),
                  SizedBox(
                    width: 130,
                    child: TextField(
                      controller: massController,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Mass",
                          hintStyle: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w300,
                              color: Colors.white.withOpacity(.8))),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: calculate,
                      child: Text(
                        "Calculate",
                        style: TextStyle(
                            fontSize: 34, color: HexColor(primaryColor)),
                      ))
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _value.toStringAsFixed(2),
                    style:
                        TextStyle(color: HexColor(primaryColor), fontSize: 42),
                  )
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _result,
                    style:
                        TextStyle(color: HexColor(primaryColor), fontSize: 42),
                  )
                ],
              ),
              const RightBar(barWidth: 30),
              const SizedBox(height: 20),
              const RightBar(barWidth: 70),
              const SizedBox(height: 20),
              const RightBar(barWidth: 30),
              const LeftBar(barWidth: 50),
              const SizedBox(height: 50),
              const LeftBar(barWidth: 50)
            ],
          ),
        ),
      ),
    );
  }
}
