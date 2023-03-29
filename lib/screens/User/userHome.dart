import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:straycare_app/screens/User/Adopt/toAdoptList.dart';
import 'package:straycare_app/screens/User/Donate/donate.dart';
import 'package:straycare_app/screens/User/Report/report.dart';

import '../../style/style.dart';
import '../boarding/loginIndex.dart';
import 'Findpet/missingList.dart';
class UserHome extends StatefulWidget {
   UserHome({Key? key,required this.uid}) : super(key: key);
var uid;

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  var _selectedItem;
  @override
  void initState(){

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text('Do you want to LogOut ?'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginIndex()));
                            },
                            child: Text('Yes')),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('No')),
                      ],
                    );
                  });
            },
            icon: Icon(Icons.arrow_back_outlined)),
        // title: Text("Reports"),
        // centerTitle: true,
        backgroundColor: Color(0xff9088E4),
        actions: [
          PopupMenuButton(
              onSelected: (item) {
                setState(() {
                  _selectedItem = item;
                });

                switch (_selectedItem) {
                  case 'logout':
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginIndex()));
                    break;
                }
              },
              icon: Icon(Icons.logout),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(value: 'logout', child: Text('LogOut')),
                ];
              }),
        ],
      ),

      body: Container(
        height:double.infinity,
        width: double.infinity,
        decoration:bubble,
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: ListView(

            children:[

             SizedBox(height: 180,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Report(uid: widget.uid,)));
                },
                child: Container(
                    height: 65,
                    width: 300,
                    decoration: btnDecoration,
                    child:Center(child: Text('Report an Incident',style:whiteTextPlay),)
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MissingPet()));
                },
                child: Container(
                    height: 65,
                    width: 300,
                    decoration: btnDecoration,
                    child:Center(child: Text('Find your Pet',style:whiteTextPlay),)
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ListToAdopt(
                    uid: widget.uid,
                  )));
                },
                child: Container(
                    height: 65,
                    width: 300,
                    decoration: btnDecoration,
                    child:Center(child: Text('Adopt',style:whiteTextPlay),)
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Donate(uid: widget.uid)));
                },
                child: Container(
                    height: 65,
                    width: 300,
                    decoration: btnDecoration,
                    child:Center(child: Text('Donate',style:whiteTextPlay),)
                ),
              ),
              SizedBox(height: 10,),
              // InkWell(
              //   onTap: (){
              //     Navigator.push(context, MaterialPageRoute(builder: (context)=>UserHome()));
              //   },
              //   child: Container(
              //       height: 65,
              //       width: 300,
              //       decoration: btnDecoration,
              //       child:Center(child: Text('About Us',style:whiteTextPlay),)
              //   ),
              // ),
              // SizedBox(height: 10,),
            ],
          ),
        ),),
    );
  }
}
