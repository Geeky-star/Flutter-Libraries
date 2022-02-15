import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SliverList in Flutter',
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sliver tools package"),
          centerTitle: true,
        ),
        body: CustomScrollView(slivers: [
          SliverPinnedHeader(
              child: Container(
                  color: Colors.blue[100],
                  height: 100,
                  child: Text(
                    "I am a Pinned Header",
                    style: TextStyle(fontSize: 30),
                  ))),
          SliverAnimatedPaintExtent(
            duration: const Duration(milliseconds: 150),
            child: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      color: Colors.pink[100],
                      height: 40,
                      alignment: Alignment.center,
                      child: Text(
                        "$index",
                        style: const TextStyle(fontSize: 30),
                      ),
                    ),
                  );
                },
                childCount: 10, // 40 list items
              ),
            ),
          ),
          SliverStack(
            insetOnOverlap: true, // defaults to false
            children: <Widget>[
              SliverPositioned.fill(
                child: Container(color: Colors.yellow),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        color:
                            index % 2 == 0 ? Colors.green : Colors.greenAccent,
                        height: 40,
                        alignment: Alignment.center,
                        child: Text(
                          "Item $index",
                          style: const TextStyle(fontSize: 30),
                        ),
                      ),
                    );
                  },
                  childCount: 10, // 40 list items
                ),
              ),
            ],
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 2.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  height: 20,
                  color: Colors.amber[100],
                  alignment: Alignment.center,
                  child: Text(index.toString()),
                );
              },
              childCount: 41,
            ),
          )
        ]));
  }
}
