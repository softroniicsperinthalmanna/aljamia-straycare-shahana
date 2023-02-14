import 'package:flutter/material.dart';
import 'package:straycare_app/screens/User/Report/report.dart';
import 'package:straycare_app/screens/User/userHome.dart';
import 'package:straycare_app/screens/boarding/boarding.dart';

import 'DEMO/views/locationEx.dart';
import 'screens/localgovernment/lsgcasecard.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BoardingScreen(),
    );
  }
}
