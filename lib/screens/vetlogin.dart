
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:straycare_app/screens/vecterinary/vecterinarycasecard.dart';

import '../../models/model.dart';
import '../../style/style.dart';
class vetLogin extends StatefulWidget {
  const vetLogin({Key? key}) : super(key: key);

  @override
  State<vetLogin> createState() => _vetLoginState();
}

class _vetLoginState extends State<vetLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height:double.infinity,
          width: double.infinity,
          decoration:bubble,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Padding(
                  padding: const EdgeInsets.only(top: 42.0),
                  child: Text("Stray Care",style:GoogleFonts.playball(fontSize: 72,color:Color(0xff9088E4) ),),
                ),
                Image(image: AssetImage("assets/images/"+logo),height: 420,width: 420,),
                Padding(
                  padding: const EdgeInsets.only(top:1.0,left: 50,right: 50),
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
                  padding: const EdgeInsets.only(top:20.0,left: 50,right: 50,bottom:15),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>VetCaseCard()));

                  },
                  child: Container(
                      height: 65,
                      width: 290,
                      decoration: btnDecoration,
                      child:Center(child: Text('Submit',style:btnText),)
                  ),
                )
              ],
            ),
          ),),
      floatingActionButton: FloatingActionButton(
      backgroundColor:Color(0xff9088E4) ,
      foregroundColor: Colors.white,
      onPressed: (){},
      child: Icon(Icons.arrow_back_ios_new,size: 30,),
    ),
    );
  }
}



