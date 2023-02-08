import 'package:flutter/material.dart';
import 'package:test/login.dart';

class savingMoney extends StatefulWidget {
  final Map<String, String> getdata;
  const savingMoney({super.key, required this.getdata});

  @override
  State<savingMoney> createState() => _savingMoneyState();
}

class _savingMoneyState extends State<savingMoney> {
  @override
  Widget AppName() {
    return Container(
      child: Text(
        "เงินออม",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.w500,
          color: Colors.red,
        ),
      ),
      margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
    );
  }

  Widget monney_Result() {
    return Container(
      child: Text(
        "จำนวนเงินที่ควรออม = " + widget.getdata["monny"].toString(),
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

  Widget Back_BTN() {
    return Container(
      child: ElevatedButton(
        child: Text("Back"),
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            backgroundColor: Colors.green,
            shadowColor: Colors.red),
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => firstFrm()));
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
                children: [AppName(), monney_Result(), Back_BTN()],
              ),
            ),
          ),
        )
      ],
    );
  }
}
