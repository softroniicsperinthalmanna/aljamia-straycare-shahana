import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veterinary/screens/police/policelogin.dart';

import '../../models/model.dart';
import '../../style/style.dart';
class policeCaseCard extends StatefulWidget {
  const policeCaseCard({Key? key}) : super(key: key);

  @override
  State<policeCaseCard> createState() => _policeCaseCardState();
}

class _policeCaseCardState extends State<policeCaseCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: ListView.builder(
              itemCount: police.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Card(
                    color: Color(0xffd4ecfa),
                    elevation: 10,

                    child: Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children:[
                            Padding(
                              padding: const EdgeInsets.only(left: 95.0,top: 10,bottom: 10),
                              child: Container(

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.person_pin,color:Color(0xff9088E4) ,),
                                        SizedBox(width: 10,),

                                        Text(police[index]['reporter_name'],style:GoogleFonts.poppins(color:Color(0xff9088E4) ,fontSize: 22,fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.location_on,color:Color(0xff9088E4) ,),
                                        SizedBox(width: 10,),

                                        Text(police[index]['location'],style: normalText,),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.timer_outlined,color:Color(0xff9088E4) ,),
                                        SizedBox(width: 10,),
                                        Text(police[index]['time'],style: normalText,),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                height: 65,
                                width: 290,
                                decoration:btnDecoration,
                                child:Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.phone,color: Colors.white,size: 30,),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text('Call Reporter',style: btnText),
                                    ],
                                  ),
                                ),

                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              height: 338,
                              width:MediaQuery.of(context).size.width,
                              child:Image(image: AssetImage("assets/images/"+police[index]['img']),fit: BoxFit.cover,),

                            ),
                            Container(
                              height: 120,
                              width: MediaQuery.of(context).size.width,
                              child:Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(police[index]['description'],style: normalText),
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xff9088E4))
                              ),
                            ),



                          ]
                      ),
                    ),
                  ),
                );
              })
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:Color(0xff9088E4) ,
        foregroundColor: Colors.white,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>policelogin()));

        },
        child: Icon(Icons.arrow_back_ios_new,size: 30,),
      ),

    );
  }
}
