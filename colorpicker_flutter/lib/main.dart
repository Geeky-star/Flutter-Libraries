import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() => runApp(const MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color currentColor = Colors.green;
  List<Color> currentColors = [Colors.yellow, Colors.red];

  void changeColor(Color color) => setState(() => currentColor = color);
  void changeColors(List<Color> colors) =>
      setState(() => currentColors = colors);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('GeeksForGeeks'),
            backgroundColor: currentColor,
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Container(
              height: 1000,
              child: Column(
                children: [
                  Text("Block Picker"),
                  Expanded(
                    child: BlockPicker(
                        pickerColor: currentColor, onColorChanged: changeColor),
                  ),
                  SizedBox(height: 10),
                  Text("Material Picker"),
                  Expanded(
                    child: MaterialPicker(
                        pickerColor: currentColor, onColorChanged: changeColor),
                  ),
                  SizedBox(height: 10),
                  Text("MaterialChoiceBlockPicker"),
                  Expanded(
                    child: MultipleChoiceBlockPicker(
                      pickerColors: currentColors,
                      onColorsChanged: changeColors,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
