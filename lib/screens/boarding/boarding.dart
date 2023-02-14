import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/model.dart';
import '../../style/style.dart';
import 'loginIndex.dart';
class BoardingScreen extends StatelessWidget {
  const BoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height:double.infinity,
        width: double.infinity,
        decoration:bubble,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              Text("Stray Care",style:GoogleFonts.playball(fontSize: 72,color:Color(0xff9088E4) ),),
              Container(
                height: 400,width: 500,
                child: Image(
                  image: AssetImage("assets/images/"+logo),fit: BoxFit.cover,),
              ),
              Text('Nurture. Protect. Love. Heal.',style: boardText,),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('You are on your destination where you get the opportunity to express your empathy towards those animals in their most needed situations  ',style: boardText,),
              ),
              SizedBox(height: 20,),

              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginIndex()));
                },
                child: Container(
                    height: 65,
                    width: 300,
                    decoration: btnDecoration,
                    child:Center(child: Text('Get Started',style:btnText),)
                ),
              )
            ],
          ),
        ),),
    );
  }
}
