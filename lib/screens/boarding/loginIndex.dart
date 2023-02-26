import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:straycare_app/auth/userLogin.dart';
import 'package:straycare_app/screens/localgovernment/lsglogin.dart';
import 'package:straycare_app/auth/login.dart';
import 'package:straycare_app/screens/police/policelogin.dart';
import 'package:straycare_app/screens/vetlogin.dart';

import '../../style/style.dart';
import '../forest/forestLogin.dart';
class LoginIndex extends StatelessWidget {
   LoginIndex({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                child: Text("Stray Care",style: mainHead
                  ,),
              ),
              SizedBox(height: 20,),

              Container(
                  height: 75,
                  width: 300,
                  decoration: btnDecoration,
                  child:Center(child: Text('Login as : ',style:btnText),)
              ),
              SizedBox(height: 30,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>UserLogin(

                  )));
                },
                child: Container(
                    height: 65,
                    width: 300,
                    decoration: btnDecoration,
                    child:Center(child: Text('User(public)',style:btnText),)
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Login(
                    type:'office' ,
                  )));
                },
                child: Container(
                    height: 65,
                    width: 300,
                    decoration: btnDecoration,
                    child:Center(child: Text('Stray Care Office',style:btnText),)
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Login(
                    type: 'police',
                  )));
                },
                child: Container(
                    height: 65,
                    width: 300,
                    decoration: btnDecoration,
                    child:Center(child: Text('Police',style:btnText),)
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Login(
                    type: 'forest',
                  )));
                },
                child: Container(
                    height: 65,
                    width: 300,
                    decoration: btnDecoration,
                    child:Center(child: Text('Forest',style:btnText),)
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Login(
                    type: 'vet',
                  )));
                },
                child: Container(
                    height: 65,
                    width: 300,
                    decoration: btnDecoration,
                    child:Center(child: Text('veterinary',style:btnText),)
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Login(
                    type: 'lsg',
                  )));
                },
                child: Container(
                    height: 65,
                    width: 300,
                    decoration: btnDecoration,
                    child:Center(child: Text('Local self-government',style:btnText),)
                ),
              ),

              SizedBox(height: 10,),
            ],
          ),
        ),),
    );
  }
}
