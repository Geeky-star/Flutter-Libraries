import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Widgets',
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GeeksForGeeks"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FadeInLeft(duration: Duration(seconds: 4), child: NewContainer()),
            BounceInUp(child: NewContainer(), duration: Duration(seconds: 4)),
            Swing(
              child: NewContainer(),
              infinite: true,
            ),
            Bounce(child: NewContainer(), infinite: true),
            Dance(child: NewContainer(), infinite: true),
            Roulette(child: NewContainer(), infinite: true),
            Spin(child: NewContainer(), infinite: true),
            SlideInLeft(duration: Duration(seconds: 4), child: NewContainer())
          ],
        ),
      ),
    );
  }
}

class NewContainer extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(height: 60, width: 60, color: Colors.green);
  }
}
