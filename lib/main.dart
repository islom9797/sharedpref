import 'package:flutter/material.dart';
import 'package:sharedpref/pages/netdemomainpage.dart';
import 'package:sharedpref/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: NetdemoMainPage(),
      routes: {

      },
    );
  }
}

