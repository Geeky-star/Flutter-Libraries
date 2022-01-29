import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Dio',
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
  Future<void> getData() async {
    Response response;
    var dio = Dio();
    response = await dio.get('https://jsonplaceholder.typicode.com/users');
    //print(response.data.toString());
    // response = await dio.get('https://jsonplaceholder.typicode.com/users', queryParameters: {
    // 'id': 11,
    //});
    print(response.data.toString());
  }

  Future<void> postData() async {
    var dio = Dio();
    var response = await dio.post('https://jsonplaceholder.typicode.com/users',
        data: {
          "name": 'geeksforgeeks',
          "username": 'geek',
          "email": 'abc@gmail.com'
        });

    print(response.data.toString());
  }

  Future<void> downloadData() async {
    var dio = Dio();
    var response =
        await dio.download('https://www.geeksforgeeks.org/', './xx.html');
  }

  Future<void> getInformation() async {
    var dio = Dio();
    var response = await dio.get('https://jsonplaceholder.typicode.com/users');
    print(response.data);
    print(response.headers);
    print(response.requestOptions);
    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GeeksForGeeks"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  getData();
                },
                child: Text("GET")),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  postData();
                },
                child: Text("POST")),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  downloadData();
                },
                child: Text("DOWNLOAD")),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  getInformation();
                },
                child: Text("GET INFO"))
          ],
        ),
      ),
    );
  }
}
