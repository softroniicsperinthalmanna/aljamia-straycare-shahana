import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:straycare_app/screens/User/Report/reportingCase.dart';
import 'package:straycare_app/screens/User/userHome.dart';

import '../../../style/style.dart';
import '../../boarding/loginIndex.dart';
class Report extends StatefulWidget {
   Report({Key? key,required this.uid}) : super(key: key);
 var uid;

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  var _selectedItem;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(


        // title: Text("Reports"),
        // centerTitle: true,
        backgroundColor: Color(0xff9088E4),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => UserHome(uid:widget.uid)));

          }, icon: Icon(Icons.home)),
          // PopupMenuButton(
          //     onSelected: (item) {
          //       setState(() {
          //         _selectedItem = item;
          //       });
          //
          //       switch (_selectedItem) {
          //         case 'logout':
          //           Navigator.pushReplacement(context,
          //               MaterialPageRoute(builder: (context) => LoginIndex()));
          //           break;
          //       }
          //     },
          //     icon: Icon(Icons.logout),
          //     itemBuilder: (context) {
          //       return [
          //         PopupMenuItem(value: 'logout', child: Text('LogOut')),
          //       ];
          //     }),
        ],
      ),

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
                      uid: widget.uid,
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
                    uid: widget.uid,
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
                    uid: widget.uid,
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
                    uid: widget.uid,
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
                    uid: widget.uid,
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
