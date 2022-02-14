import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geolocator',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Position? position;
  getCurrentPosition() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      // position = position;
    });

    return position;
  }

  getLastPosition() async {
    position = await Geolocator.getLastKnownPosition();
    return position;
  }

  getLocationUpdates() {
    final LocationSettings locationSettings =
        LocationSettings(accuracy: LocationAccuracy.best, distanceFilter: 0);

    StreamSubscription<ServiceStatus> serviceStatusStream =
        Geolocator.getServiceStatusStream().listen((ServiceStatus status) {
      print(status);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GeeksForGeeks"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  // getCurrentPosition();
                  //  getLastPosition();
                  getLocationUpdates();
                },
                child: Text("GET")),
            SizedBox(height: 50),
            Text("Current Position  - "),
            SizedBox(
              height: 10,
            ),
            Text(position.toString()),
          ],
        ),
      ),
    );
  }
}
