import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clipboard Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GeeksForGeeks"),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                TextFormField(
                  controller: message,
                  decoration: InputDecoration(hintText: 'Enter text'),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () {
                          if (message.text.trim() == "") {
                            //do nothing
                          } else {
                            FlutterClipboard.copy(message.text)
                                .then((value) => print('copied text'));
                          }
                        },
                        child: Text(
                          'COPY',
                          style: TextStyle(color: Colors.white),
                        )),
                    ElevatedButton(
                      onPressed: () {
                        FlutterClipboard.paste().then((value) {
                          setState(() {
                            message.text = value;
                          });
                        });
                      },
                      child: Text(
                        'PASTE',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
