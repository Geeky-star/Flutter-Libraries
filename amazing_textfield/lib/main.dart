import 'package:flutter/material.dart';
import 'package:gradient_textfield/gradient_textfield.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Gradient TextFields',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("GeeksForGeeks"),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Gradienttextfield(
                controller: name,
                radius: 40,
                height: 60,
                width: 400,
                colors: const [Colors.pink, Colors.red],
                text: "Enter Name",
                fontColor: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
              SizedBox(height: 20),
              Gradienttextfield(
                controller: name,
                radius: 2,
                height: 60,
                width: 400,
                colors: const [Colors.green, Colors.yellow],
                text: "Enter Email",
                fontColor: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
