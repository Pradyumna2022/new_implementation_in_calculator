import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? num1, num2;
  String texttoDisplay = "";
  String? res;
  String? operationper;

  void btnClicked(String btnvalue){
    if(btnvalue == "C"){
      num1 = 0;
      num2 = 0;
      res = "";
      texttoDisplay = "";
    }
    else if(btnvalue == "+" || btnvalue == "-" || btnvalue == "x" || btnvalue == "/"){
      num1 = int.parse(texttoDisplay);
      res = "";
      operationper = btnvalue;
    }
    else if(btnvalue == "="){
      num2 = int.parse(texttoDisplay);
      if(operationper == "+") {
          res = (num1! + num2!).toString();
      }
      if(operationper == "-") {
        res = (num1! - num2!).toString();
      }
      if(operationper == "x") {
        res = (num1! * num2!).toString();
      }
      if(operationper == "/") {
        res = (num1! / num2!).toString();
      }
    }
    else{
      res = int.parse(texttoDisplay+btnvalue).toString();
    }
    setState(() {
      texttoDisplay = res!;
    });
  }

  Widget customButton(String btnvalue){
    return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            onPressed: ()=>btnClicked(btnvalue),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("$btnvalue",style: TextStyle(fontSize: 25,color: Colors.black),
              textAlign: TextAlign.center,),
            ),
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Calculator @"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child: Container(
                padding: EdgeInsets.all(12),
                alignment: Alignment.bottomRight,
                child: Text("$texttoDisplay",style: TextStyle(color: Colors.white,fontSize: 34),
                ),
              )),
          Row(
            children: [
              customButton("9"),
              customButton("8"),
              customButton("7"),
              customButton("+"),

            ],
          ),
          Row(
            children: [
              customButton("6"),
              customButton("5"),
              customButton("4"),
              customButton("-"),

            ],
          ),
          Row(
            children: [
              customButton("3"),
              customButton("2"),
              customButton("1"),
              customButton("x"),

            ],
          ),
          Row(
            children: [
              customButton("C"),
              customButton("0"),
              customButton("="),
              customButton("/"),

            ],
          ),
        ],
      ),
    );
  }
}
