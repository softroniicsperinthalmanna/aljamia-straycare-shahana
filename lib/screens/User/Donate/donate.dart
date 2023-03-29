import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:straycare_app/auth/userLogin.dart';

import '../../../connection/connect.dart';
import '../../../style/style.dart';


class Donate extends StatefulWidget {
  Donate({Key? key,required this.uid}) : super(key: key);
  var uid;
  @override
  State<Donate> createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  var payList = [
    'Google Pay',
    'Phone Pay',
    'PayTM ',
    'Other',
  ];
  var amt = TextEditingController();
  var _selectedPay;

  @override
  void initState() {
    super.initState();
    print(widget.uid);
  }

  Future<void> sendData() async {
    print(widget.uid);
    print(amt.text);
    print(_selectedPay);
    var data = {

      "uid": widget.uid,
      "amt": amt.text,
      "method": _selectedPay,
      "date": DateTime.now().toString(),
    };
    var response =
    await post(Uri.parse('${Con.url}donation.php'), body: data);
    print(response.body);
    print(response.statusCode);
    if(jsonDecode(response.body)['result']=='success'){
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(' Successfully Donated....')));
     Navigator.pop(context);
    }else{
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(' Failed to Donate !!....')));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height:double.infinity,
          width: double.infinity,
          decoration:bubble,
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: ListView(
              children: [
                SizedBox(
                  height: 150,
                ),
                Center(
                    child: Text(
                      ' Give a Helping Hand to  Pets in Need',
                      style: authHead,
                    )),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                    controller: amt,
                    keyboardType: TextInputType.number,
                    decoration: dec("Amount")),
                SizedBox(
                  height: 12,
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(

                      hint: Text('  --select your payment method--'),
                      value: _selectedPay,
                      items: payList.map((e) => DropdownMenuItem(child: Text(e),value: e,)).toList(),
                      onChanged: (val){
                        setState(() {
                          _selectedPay=val as String?;
                        });
                      }
                  ),
                ),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.amber)),
                    onPressed: () {
                      if(amt.text.isNotEmpty && _selectedPay.isNotEmpty ){
                        sendData();
                      }else{
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(' All fields required !!! ....')));

                      }



                      // print(nameController.text);
                    },
                    child: Text('Donate', style: authBtn))
              ],
            ),
          ),
        ),
    floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 200.0,right: 20,left: 1),
        child: FloatingActionButton(
          backgroundColor:Color(0xff9088E4) ,
          foregroundColor: Colors.white,
          onPressed: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new,size: 30,),
        ),
      ),
    );
  }
}
