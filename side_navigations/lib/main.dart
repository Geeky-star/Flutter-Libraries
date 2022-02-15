import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Rails',
      debugShowCheckedModeBanner: false,
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
  //initialize a index
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GeeksForGeeks"),
        centerTitle: true,
      ),
      body: Row(
        children: <Widget>[
          //create a navigation rail
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            backgroundColor: Colors.green,
            destinations: const <NavigationRailDestination>[
              //navigation destinations
              NavigationRailDestination(
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(Icons.favorite),
                label: Text('Wishlist'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person_outline_rounded),
                selectedIcon: Icon(Icons.person),
                label: Text('Account'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.shopping_cart_outlined),
                selectedIcon: Icon(Icons.shopping_cart),
                label: Text('Cart'),
              ),
            ],
            selectedIconTheme: IconThemeData(color: Colors.white),
            unselectedIconTheme: IconThemeData(color: Colors.black),
            selectedLabelTextStyle: TextStyle(color: Colors.white),
          ),
          const VerticalDivider(thickness: 1, width: 2),
          Expanded(
            child: Center(
              child: Text('Page Number: $_selectedIndex'),
            ),
          )
        ],
      ),
    );
  }
}
