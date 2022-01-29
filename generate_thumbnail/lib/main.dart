import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

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

  @override
  void initState() {
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
            ],
          )),
    );
  }
}
