import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _textColor = Colors.green;
  Color _appBarColor = Colors.green;
  bool status = false;
  bool isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GeeksForGeeks"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              FlutterSwitch(
                width: 100.0,
                height: 55.0,
                toggleSize: 45.0,
                value: status,
                borderRadius: 30.0,
                padding: 2.0,
                toggleColor: Colors.black12,
                switchBorder: Border.all(
                  color: Colors.black,
                  width: 6.0,
                ),
                toggleBorder: Border.all(
                  color: Colors.white,
                  width: 5.0,
                ),
                activeColor: Colors.green,
                inactiveColor: Colors.black38,
                onToggle: (val) {
                  setState(() {
                    status = val;
                  });
                },
              ),
              SizedBox(height: 20.0),
              FlutterSwitch(
                width: 125.0,
                height: 55.0,
                valueFontSize: 25.0,
                toggleSize: 45.0,
                value: status,
                borderRadius: 30.0,
                padding: 8.0,
                showOnOff: true,
                onToggle: (val) {
                  setState(() {
                    status = val;
                  });
                },
              ),
              SizedBox(height: 20.0),
              FlutterSwitch(
                activeText: "I am Active",
                inactiveText: "I am Inactive",
                value: status,
                valueFontSize: 16.0,
                width: 140,
                height: 80,
                borderRadius: 30.0,
                showOnOff: true,
                onToggle: (val) {
                  setState(() {
                    status = val;
                  });
                },
              ),
              SizedBox(height: 10.0),
              FlutterSwitch(
                width: 100.0,
                height: 55.0,
                toggleSize: 45.0,
                value: status,
                borderRadius: 30.0,
                padding: 2.0,
                activeToggleColor: Colors.purple,
                inactiveToggleColor: Colors.black,
                activeSwitchBorder: Border.all(
                  color: Colors.orange,
                  width: 6.0,
                ),
                inactiveSwitchBorder: Border.all(
                  color: Colors.black,
                  width: 6.0,
                ),
                activeColor: Colors.deepPurpleAccent,
                inactiveColor: Colors.white,
                activeIcon: Icon(
                  Icons.nightlight_round,
                  color: Colors.white,
                ),
                inactiveIcon: Icon(
                  Icons.wb_sunny,
                  color: Color(0xFFFFDF5D),
                ),
                onToggle: (val) {
                  setState(() {
                    status = val;
                  });
                },
              ),
              SizedBox(height: 20.0),
              FlutterSwitch(
                width: 100.0,
                height: 55.0,
                toggleSize: 45.0,
                value: status,
                borderRadius: 30.0,
                padding: 2.0,
                activeToggleColor: Colors.purple,
                inactiveToggleColor: Colors.white,
                activeSwitchBorder: Border.all(
                  color: Colors.green,
                  width: 6.0,
                ),
                inactiveSwitchBorder: Border.all(
                  color: Colors.deepPurple,
                  width: 6.0,
                ),
                activeColor: Colors.greenAccent,
                inactiveColor: Colors.blueAccent,
                activeIcon: Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/7/7e/Dart-logo.png"),
                inactiveIcon: Image.network(
                    "https://img2.pngio.com/functional-bits-in-flutter-flutter-community-medium-flutter-png-1000_1000.png"),
                onToggle: (val) {
                  setState(() {
                    status = val;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
