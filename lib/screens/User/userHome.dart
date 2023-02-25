import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:straycare_app/screens/User/Adopt/toAdoptList.dart';
import 'package:straycare_app/screens/User/Report/report.dart';

import '../../style/style.dart';
import 'Findpet/missingList.dart';
class UserHome extends StatelessWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Report()));
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ListToAdopt()));
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>UserHome()));
                },
                child: Container(
                    height: 65,
                    width: 300,
                    decoration: btnDecoration,
                    child:Center(child: Text('Donate',style:whiteTextPlay),)
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>UserHome()));
                },
                child: Container(
                    height: 65,
                    width: 300,
                    decoration: btnDecoration,
                    child:Center(child: Text('About Us',style:whiteTextPlay),)
                ),
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),),
    );
  }
}
