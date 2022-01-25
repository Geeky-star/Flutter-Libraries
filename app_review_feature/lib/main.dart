import 'dart:io';

import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'In App Review Demo',
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
  final InAppReview _inAppReview = InAppReview.instance;

  String _appStoreId = '';
  String _microsoftStoreId = '';
  // Availability _availability = Availability.loading;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      try {
        final isAvailable = await _inAppReview.isAvailable();

        setState(() {
          // This plugin cannot be tested on Android by installing your app
          // locally. See https://github.com/britannio/in_app_review#testing for
          // more information.
          //     _availability = isAvailable && !Platform.isAndroid
          //       ? Availability.available
          //     : Availability.unavailable;
        });
      } catch (e) {
        //    setState(() => _availability = Availability.unavailable);
      }
    });
  }

  void _setAppStoreId(String id) => _appStoreId = id;

  void _setMicrosoftStoreId(String id) => _microsoftStoreId = id;

  Future<void> _requestReview() => _inAppReview.requestReview();

  Future<void> _openStoreListing() => _inAppReview.openStoreListing(
        appStoreId: _appStoreId,
        microsoftStoreId: _microsoftStoreId,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GeeksForGeeks'), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //      Text('In App Review status: ${_availability.name}'),
          TextField(
            onChanged: _setAppStoreId,
            decoration: InputDecoration(hintText: 'App Store ID'),
          ),
          TextField(
            onChanged: _setMicrosoftStoreId,
            decoration: InputDecoration(hintText: 'Microsoft Store ID'),
          ),
          ElevatedButton(
            onPressed: _requestReview,
            child: Text('Request Review'),
          ),
          ElevatedButton(
            onPressed: _openStoreListing,
            child: Text('Open Store Listing'),
          ),
        ],
      ),
    );
  }
}
