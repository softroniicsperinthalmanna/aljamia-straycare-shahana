import 'package:flutter/material.dart';
import 'package:straycare_app/screens/User/Adopt/toAdoptList.dart';
import 'package:straycare_app/screens/User/Report/report.dart';
import 'package:straycare_app/screens/User/userHome.dart';
import 'package:straycare_app/screens/boarding/boarding.dart';
import 'package:straycare_app/screens/boarding/loginIndex.dart';
import 'package:straycare_app/screens/office/adopt.dart';
import 'package:straycare_app/screens/office/adoptAccepted.dart';
import 'package:straycare_app/screens/office/adoptRequest.dart';
import 'package:straycare_app/screens/office/adoptedlist.dart';
import 'package:straycare_app/screens/office/collectedlist.dart';
import 'package:straycare_app/screens/office/createCollectionList.dart';
import 'package:straycare_app/screens/office/fosteringlist.dart';
import 'package:straycare_app/screens/office/viewlist.dart';

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
