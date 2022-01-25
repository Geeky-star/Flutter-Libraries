import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sticky Header Demo',
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
  List images = [
    [
      'Sunset',
      'https://static.photocdn.pt/images/articles/2017_4/iStock-536113185.jpg'
    ],
    [
      'Cat',
      'https://www.readersdigest.ca/wp-content/uploads/2020/02/GettyImages-1202925582-e1582140494731.jpg'
    ],
    [
      'Dog',
      'https://www.vets4pets.com/siteassets/dental-webheaders-dog---oct-20.jpg?w=585&scale=down'
    ],
    [
      'Best Dog',
      'https://petsreporter.com/wp-content/uploads/2021/06/Best-Dog-Breeds-for-Guard-Dogs-1-768x644.png'
    ],
    ['Another Dog', 'https://wallpapers-fenix.eu/full/180829/121517468.jpg'],
    [
      'More Dog',
      'http://3.bp.blogspot.com/-vpK4CUGISRQ/T37xB2PwSiI/AAAAAAAAAYE/7cyBM6ZNNdg/w1200-h630-p-k-no-nu/Dog+Beagles.jpg'
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GeeksForGeeks"),
          centerTitle: true,
        ),
        body: Container(
            child: ListView.builder(
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return StickyHeaderBuilder(
                    builder: (context, amount) {
                      return Container(
                        height: 50.0,
                        color: Colors.red,
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          images[index][0],
                          style: const TextStyle(
                              color: Colors.white, fontSize: 17),
                        ),
                      );
                    },
                    overlapHeaders: false,
                    content: Container(
                      child: Image.network(images[index][1],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200.0),
                    ),
                  );
                })));
  }
}
