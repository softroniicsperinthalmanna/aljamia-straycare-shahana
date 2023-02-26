import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:straycare_app/auth/userLogin.dart';

import '../../connection/connect.dart';
import '../style/style.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);
  var userType;
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var dateList = [
    DateTime(DateTime.now().year - 2).year,
    DateTime(DateTime.now().year - 1).year,
    DateTime.now().year,
    DateTime(DateTime.now().year + 1).year,
    DateTime(DateTime.now().year + 2).year
  ];
  var deptList = [
    'Maths',
    'Physics',
    'Computer Science',
    'Chemistry',
    'Biology',
    'Food Technology',
    'Psychology'
  ];
  var degreeList = ['UG', 'PG'];
  var nameCtrlr = TextEditingController();
  var adrsCtrlr = TextEditingController();
  var phoneCtrlr = TextEditingController();
  var passwordCtrlr = TextEditingController();

  @override
  void initState() {
    super.initState();
    print(widget.userType);
  }

  Future<void> signUp() async {
    var data = {
      "name": nameCtrlr.text,
      "phone": phoneCtrlr.text,
      "password": passwordCtrlr.text,
      "address": adrsCtrlr.text,
    };
    var response =
        await post(Uri.parse('${Con.url}userRegister.php'), body: data);
    print(response.body);
    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(50.0),
      child: ListView(
        children: [
          Center(
              child: Text(
            'Create Account',
            style: authHead,
          )),
          SizedBox(
            height: 20,
          ),
          TextFormField(
              controller: nameCtrlr,
              keyboardType: TextInputType.name,
              decoration: dec("Name")),
          TextFormField(
              controller: adrsCtrlr,
              keyboardType: TextInputType.text,
              maxLines: 3,
              decoration: dec("Address")),
          TextFormField(
            controller: phoneCtrlr,
            keyboardType: TextInputType.phone,
            decoration: dec("Mobile"),
          ),
          TextFormField(
            controller: passwordCtrlr,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            obscuringCharacter: '*',
            decoration: dec("Password"),
          ),
          SizedBox(
            height: 12,
          ),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.amber)),
              onPressed: () {
                signUp();
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Registered....')));
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserLogin()));

                // print(nameController.text);
              },
              child: Text('Sign Up', style: authBtn))
        ],
      ),
    ));
  }
}
