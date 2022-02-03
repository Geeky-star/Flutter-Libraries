import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:tuple/tuple.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ImageFormat _format = ImageFormat.JPEG;
  int _quality = 10;
  int _size = 0;

  String? _tempDir;
  String? filePath;

  getData() {
    const t = Tuple2<String, int>('geeksforgeeks', 10);

    print(t.item1);
    print(t.item2);

    const t2 = Tuple3('geeksforgeeks', 'tutorial', 10);
    print(t2.item1);
    print(t2.withItem3(20));

    const t3 = Tuple7(1, 2, 3, 4, 5, 6, 7);
    print(t3.toList());

    List items = [1, 2, 3, 4, 5, 6];
    var t4 = Tuple6.fromList(items);
    print(t4);
  }

  @override
  void initState() {
    getData();
    super.initState();
    getTemporaryDirectory().then((d) => _tempDir = d.path);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Tutorial'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              filePath != null
                  ? Image(image: AssetImage(filePath!))
                  : Text('No Floatting Button Click')
            ],
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FloatingActionButton(
                tooltip: "Generate a file of thumbnail",
                onPressed: () async {
                  final thumbnail = await VideoThumbnail.thumbnailFile(
                      video: 'assets/gfg.mp4',
                      thumbnailPath: _tempDir,
                      imageFormat: _format,
                      quality: _quality);

                  setState(() {
                    final file = File(thumbnail!);
                    filePath = file.path;
                  });
                },
                child: Text('Click'),
              ),
              ElevatedButton(
                child: Text("get"),
                onPressed: () {
                  getData();
                },
              )
            ],
          )),
    );
  }
}
