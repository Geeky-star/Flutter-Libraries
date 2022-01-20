import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RFlutter Alert Tutorial',
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
        title: Text("GeeksForGeeks"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100),
              ElevatedButton(
                child: Text("Click One"),
                onPressed: () {
                  Alert(
                          context: context,
                          title: "RFlutter Alert",
                          desc: "GeeksForGeeks is awesome.")
                      .show();
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    Alert(
                      context: context,
                      type: AlertType.info,
                      title: "GeeksForGeeks",
                      desc: "Create more awesome alerts with RFlutter Alert.",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "Done",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          width: 120,
                        ),
                        DialogButton(
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          width: 120,
                        )
                      ],
                    ).show();
                  },
                  child: Text("Click Two")),
              ElevatedButton(
                  onPressed: () {
                    Alert(
                      context: context,
                      title: "GeeksForGeeks",
                      desc: "Create Awesome alerts with RFlutter Alert.",
                      image:
                          Image.network("https://i.stack.imgur.com/xLOYo.png"),
                    ).show();
                  },
                  child: Text("Click Three")),
              ElevatedButton(
                  onPressed: () {
                    Alert(
                        context: context,
                        title: "Sign Up",
                        content: Column(
                          children: <Widget>[
                            TextField(
                              decoration: InputDecoration(
                                icon: Icon(Icons.email),
                                labelText: 'Email',
                              ),
                            ),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                icon: Icon(Icons.lock),
                                labelText: 'Password',
                              ),
                            ),
                          ],
                        ),
                        buttons: [
                          DialogButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              "SIGN UP",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          )
                        ]).show();
                  },
                  child: Text("Click Four")),
              ElevatedButton(
                  onPressed: () {
                    Alert(
                        title: "GeeksForGeeks",
                        context: context,
                        style: AlertStyle(
                          alertAlignment: Alignment.center,
                          animationType: AnimationType.fromBottom,
                          isCloseButton: false,
                          isOverlayTapDismiss: false,
                          descStyle: TextStyle(fontWeight: FontWeight.bold),
                          descTextAlign: TextAlign.start,
                          animationDuration: Duration(milliseconds: 300),
                          alertBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            side: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          titleStyle: TextStyle(
                            color: Colors.green,
                          ),
                        )).show();
                  },
                  child: Text("Click Five"))
            ],
          ),
        ),
      ),
    );
  }
}
