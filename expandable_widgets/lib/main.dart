import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Expandable Widgets',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("GeeksForGeeks"),
            centerTitle: true,
          ),
          body: Center(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ReadMoreText(
                        'GeeksForGeeks is the best tutorial website for programmers. If you are beginner or intermediate or expert programmer GeeksForGeeks is the best website for learning to code and learn different frameworks.',
                        trimLines: 2,
                        textScaleFactor: 1,
                        colorClickableText: Colors.red,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Show less',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                        moreStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    );
                  })),
        ));
  }
}
