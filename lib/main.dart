

import 'package:flutter/material.dart';
import 'package:veterinary/screens/forest/forestLogin.dart';
import 'package:veterinary/screens/forest/forestcasecard.dart';
import 'package:veterinary/screens/localgovernment/lsgcasecard.dart';
import 'package:veterinary/screens/localgovernment/lsglogin.dart';
import 'package:veterinary/screens/office/Deadindividual.dart';
import 'package:veterinary/screens/office/Fosteringindividual.dart';
import 'package:veterinary/screens/office/adoptedindividual.dart';
import 'package:veterinary/screens/office/adoptedlist.dart';
import 'package:veterinary/screens/office/collectedindividual.dart';
import 'package:veterinary/screens/office/collectedlist.dart';
import 'package:veterinary/screens/office/deadlist.dart';
import 'package:veterinary/screens/office/fosteringlist.dart';
import 'package:veterinary/screens/office/officelogin.dart';
import 'package:veterinary/screens/office/viewlist.dart';
import 'package:veterinary/screens/police/policecasecard.dart';
import 'package:veterinary/screens/police/policedemodialog.dart';
import 'package:veterinary/screens/vetlogin.dart';
import 'package:veterinary/screens/police/policelogin.dart';
import 'package:veterinary/screens/vecterinary/vecterinarycasecard.dart';
void main(){runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
        home: VetCaseCard(),
    );
  }
}

