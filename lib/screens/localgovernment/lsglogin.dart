
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:straycare_app/screens/localgovernment/lsgcasecard.dart';

import '../../models/model.dart';
import '../../style/style.dart';
class lsglogin extends StatefulWidget {
  const lsglogin({Key? key}) : super(key: key);

  @override
  State<lsglogin> createState() => _lsgloginState();
}

class _lsgloginState extends State<lsglogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height:double.infinity,
        width: double.infinity,
        decoration:bubble,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Text("Stray Care",style:GoogleFonts.playball(fontSize: 72,color:Color(0xff9088E4) ),),
              ),
              Container(
                height: 400,width: 500,
                child: Image(
                  image: AssetImage("assets/images/"+logo),fit: BoxFit.cover,),
              ),
              Padding(
                padding: const EdgeInsets.only(top:1.0,left: 50,right: 50,bottom: 1),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      //  borderSide: BorderSide(color: Color(0xff9088E4)),
                      borderSide: BorderSide(
                        color:  Color(0xff9088E4),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //  borderSide: BorderSide(color: Color(0xff9088E4)),
                      borderSide: BorderSide(
                        color:  Color(0xff9088E4),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    hintText: "                               ID",
                    hintStyle: TextStyle(color: Color(0xff9088E4)),


                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:10.0,left: 50,right: 50,bottom:15),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      //  borderSide: BorderSide(color: Color(0xff9088E4)),
                      borderSide: BorderSide(
                        color:  Color(0xff9088E4),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //  borderSide: BorderSide(color: Color(0xff9088E4)),
                      borderSide: BorderSide(
                        color: Color(0xff9088E4),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    hintText: "                             CODE",
                    hintStyle: TextStyle(color: Color(0xff9088E4)),

                  ),

                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>lsgCaseCard()));
                },
                child: Container(
                    height: 65,
                    width: 300,
                    decoration: btnDecoration,
                    child:Center(child: Text('Submit',style:btnText),)
                ),
                //  floatingActionButton: FloatingActionButton(
                //   backgroundColor:Color(0xff9088E4) ,
                //   foregroundColor: Colors.white,
                //   onPressed: (){},
                //   child: Icon(Icons.arrow_back_ios_new,size: 30,),
                // ),

              )
            ],
          ),
        ),),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 250.0,right: 20,left: 1),
        child: FloatingActionButton(
          backgroundColor:Color(0xff9088E4) ,
          foregroundColor: Colors.white,
          onPressed: (){},
          child: Icon(Icons.arrow_back_ios_new,size: 30,),
        ),
      ),

    )    ;
  }
}



