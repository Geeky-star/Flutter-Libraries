import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: PinPutView(),
    );
  }
}

class PinPutView extends StatefulWidget {
  @override
  PinPutViewState createState() => PinPutViewState();
}

class PinPutViewState extends State<PinPutView> {
  final _pinPutController = TextEditingController();
  final _pinPutController2 = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GeeksForGeeks"),
          centerTitle: true,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: darkRoundedPinPut()),
                Expanded(child: animatedBorders())
              ]),
        ));
  }

  Widget darkRoundedPinPut() {
    return PinPut(
      eachFieldWidth: 50.0,
      eachFieldHeight: 50.0,
      withCursor: true,
      fieldsCount: 5,
      controller: _pinPutController,
      eachFieldMargin: EdgeInsets.symmetric(horizontal: 10),
      onSubmit: (String pin) => _showSnackBar(pin),
      submittedFieldDecoration: BoxDecoration(
        color: Colors.green[800],
        borderRadius: BorderRadius.circular(15.0),
      ),
      selectedFieldDecoration: BoxDecoration(
        color: Colors.green[800],
        borderRadius: BorderRadius.circular(15.0),
      ),
      followingFieldDecoration: BoxDecoration(
        color: Colors.green[800],
        borderRadius: BorderRadius.circular(15.0),
      ),
      pinAnimationType: PinAnimationType.rotation,
      textStyle: TextStyle(color: Colors.white, fontSize: 20.0, height: 1),
    );
  }

  Widget animatedBorders() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PinPut(
        fieldsCount: 4,
        eachFieldHeight: 50.0,
        withCursor: true,
        onSubmit: (String pin) => _showSnackBar(pin),
        controller: _pinPutController2,
        submittedFieldDecoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15.0),
        ).copyWith(
          borderRadius: BorderRadius.circular(20.0),
        ),
        selectedFieldDecoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15.0),
        ),
        followingFieldDecoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15.0),
        ).copyWith(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String pin) {
    final snackBar = SnackBar(
      duration: Duration(seconds: 4),
      content: Container(
        height: 80.0,
        child: Center(
          child: Text(
            'Pin Submitted: $pin',
            style: TextStyle(fontSize: 25.0),
          ),
        ),
      ),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
