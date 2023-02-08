import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/savingMoney.dart';
import 'dart:math';

class firstFrm extends StatefulWidget {
  const firstFrm({super.key});

  @override
  State<firstFrm> createState() => _firstFrmState();
}

class _firstFrmState extends State<firstFrm> {
  @override
  TextEditingController currentAge = TextEditingController();
  TextEditingController startingAge = TextEditingController();
  TextEditingController currentSalary = TextEditingController();
  TextEditingController startingSalary = TextEditingController();
  double savings = 0.00;
  // Sting = "";
  double monnyAll() {
    savings = 2 *
        (double.parse(currentAge.text.toString()) -
            double.parse(startingAge.text.toString())) *
        (double.parse(currentSalary.text.toString()) +
            double.parse(startingSalary.text.toString()));
    return savings;
  }

  Widget AppName() {
    return Container(
      child: Text(
        "โปรแกรมคำนวณเงินออม",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.w500,
          color: Colors.red,
          fontFamily: "MiGrooseberryThin",
        ),
      ),
      margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
    );
  }

  Widget input_currentAge() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: TextFormField(
        controller: currentAge,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          labelText: "อายุปัจจุบัน ",
          labelStyle: TextStyle(
              color: Color.fromARGB(255, 248, 111, 111),
              fontFamily: "MiGrooseberryThin",
              fontWeight: FontWeight.w800),
          filled: true,
          fillColor: Colors.white,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [LengthLimitingTextInputFormatter(2)],
      ),
    );
  }

  Widget input_startingAge() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: TextFormField(
        controller: startingAge,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          labelText: "อายุเริ่มทำงาน ",
          labelStyle: TextStyle(
              color: Color.fromARGB(255, 248, 111, 111),
              fontFamily: "MiGrooseberryThin",
              fontWeight: FontWeight.w800),
          filled: true,
          fillColor: Colors.white,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [LengthLimitingTextInputFormatter(2)],
      ),
    );
  }

  Widget input_currentSalary() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: TextFormField(
        controller: currentSalary,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          labelText: "เงินเดือนปัจจุบัน ",
          labelStyle: TextStyle(
              color: Color.fromARGB(255, 248, 111, 111),
              fontFamily: "MiGrooseberryThin",
              fontWeight: FontWeight.w800),
          filled: true,
          fillColor: Colors.white,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [LengthLimitingTextInputFormatter(10)],
      ),
    );
  }

  Widget input_startingSalary() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: TextFormField(
        controller: startingSalary,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          labelText: "เงินเดือนที่เริ่มงาน",
          labelStyle: TextStyle(
              color: Color.fromARGB(255, 248, 111, 111),
              fontFamily: "MiGrooseberryThin",
              fontWeight: FontWeight.w800),
          filled: true,
          fillColor: Colors.white,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [LengthLimitingTextInputFormatter(10)],
      ),
    );
  }

  Widget Submit_BTN() {
    return Container(
      child: ElevatedButton(
        child: Text("คำนวณ"),
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            backgroundColor: Colors.green,
            shadowColor: Colors.red),
        onPressed: () {
          Map<String, String> passdata = {
            "monny": monnyAll().toString(),
          };
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => savingMoney(getdata: passdata)));
        },
      ),
    );
  }

  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bgpig.jpg'), fit: BoxFit.cover),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  AppName(),
                  input_currentAge(),
                  input_startingAge(),
                  input_currentSalary(),
                  input_startingSalary(),
                  Submit_BTN()
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
