import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/model.dart';
import '../../style/style.dart';
import 'loginIndex.dart';
class BoardingScreen extends StatelessWidget {
  const BoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height:double.infinity,
          width: double.infinity,
          decoration:bubble,
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0,left: 20,right: 20),
            child: ListView(
              children:[
               // SizedBox(height: 20,),
                Text("Stray Care",style:GoogleFonts.playball(fontSize: 72,color:Color(0xff9088E4) ),),
                Container(
                  // decoration: BoxDecoration(
                  //   border:Border.all(
                  //     color: Colors.red
                  //   )
                  // ),
                  height: 200,width: 200,

                  child: Image(
                    image: AssetImage("assets/images/"+logo),fit: BoxFit.cover,),
                ),
                Text('Nurture. Protect. Love. Heal.',
                  style: boardTextBig,
                textAlign: TextAlign.center,),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('You are on your destination where you get the opportunity to express your empathy towards those animals in their most needed situations  ',
                    style: boardText,
                  textAlign: TextAlign.justify,
                  ),
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
      ),
    );
  }
}
