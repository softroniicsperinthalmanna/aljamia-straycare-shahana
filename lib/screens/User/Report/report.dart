import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:straycare_app/screens/User/Report/reportingCase.dart';

import '../../../style/style.dart';
class Report extends StatelessWidget {
  const Report({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height:double.infinity,
        width: double.infinity,
        decoration:bubble,
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: ListView(

            children:[
              SizedBox(height: 90,),
              Center(child: Text('Choose Incident',style: subHead,)),


              SizedBox(height: 100,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ReportingCase(

                    reportType: 'injured',
                  )));
                },
                child: Container(
                    height: 65,
                    width: 300,
                    decoration: btnDecoration,
                    child:Center(child: Text('Injured',style:whiteTextPlay),)
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ReportingCase(

                    reportType: 'aggressive',
                  )));
                },
                child: Container(
                    height: 65,
                    width: 300,
                    decoration: btnDecoration,
                    child:Center(child: Text('Aggressive ',style:whiteTextPlay),)
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ReportingCase(

                    reportType: 'wild',
                  )));
                },
                child: Container(
                    height: 65,
                    width: 300,
                    decoration: btnDecoration,
                    child:Center(child: Text('Wild',style:whiteTextPlay),)
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ReportingCase(

                    reportType: 'abuse',
                  )));
                },
                child: Container(
                    height: 65,
                    width: 300,
                    decoration: btnDecoration,
                    child:Center(child: Text('Abuse',style:whiteTextPlay),)
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ReportingCase(

                    reportType: 'missing',
                  )));
                },
                child: Container(
                    height: 65,
                    width: 300,
                    decoration: btnDecoration,
                    child:Center(child: Text('Missing Pet',style:whiteTextPlay),)
                ),
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),),
    );
  }
}
