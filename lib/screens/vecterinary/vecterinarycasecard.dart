
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veterinary/screens/vetlogin.dart';

import '../../models/model.dart';
import '../../style/style.dart';
class VetCaseCard extends StatefulWidget {
  const VetCaseCard({Key? key}) : super(key: key);

  @override
  State<VetCaseCard> createState() => _VetCaseCardState();
}

class _VetCaseCardState extends State<VetCaseCard> {
  Future<void> phoneDialog() async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog( // <-- SEE HERE
          //  title: const Text('Select Booking Type'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Column(
                  children: const[Text('pmna'),
                    Text('9078256575'),
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child:Column(
                  children: const[Text('mlpm'),
                    Text('897256575'),
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Column(
                  children: const[Text('kzhkd'),
                    Text('908756575'),
                  ],
                ),
              ),
            ],
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: ListView.builder(
              itemCount: police.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Color(0xffd4ecfa),
                    elevation: 10,

                    child: Container(
                      child: Column(
                         mainAxisAlignment:MainAxisAlignment.start,
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
                                height: 300,width: 400,
                                child:Image(image: AssetImage("assets/images/Hit-a-deer.jpg",),fit:BoxFit.cover,),

                              ),
                            ),
                            Container(
                              height: 120,
                              width:400 ,
                              child:Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text('Description from the Reporter'),
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xff9088E4))
                              ),
                            ),
                            SizedBox(height: 5,),
                            Center(
                              child: Container(
                                height: 65,
                                width: 290,
                                decoration: btnDecoration,
                                child:Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:  [
                                      Icon(Icons.phone,color: Colors.white,size: 30,),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text('Call Reporter',
                                          style: btnText),
                                    ],
                                  ),
                                ),

                              ),
                            ),
                            SizedBox(height: 5,),
                            Center(
                              child: InkWell(
                                onTap: (){
                                  phoneDialog();
                                },
                                child: Container(
                                  height: 65,
                                  width: 290,
                                  decoration: btnDecoration,
                                  child:Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.phone,color: Colors.white,size: 30,),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text('Call StrayCare',style:
                                        btnText),
                                      ],
                                    ),
                                  ),

                                ),

                              ),
                            ),
                            SizedBox(height: 5,),
                            InkWell(
                              onTap: (){},
                              child: Center(
                                child: Container(
                                    height: 65,
                                    width: 290,
                                    decoration: btnDecoration,
                                    child:Center(child: Text('Submit',style:(btnText),))
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),






                          ]
                      ),
                    ),
                  ),
                );
              })
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20.0,),
        child: FloatingActionButton(
          backgroundColor:Color(0xff9088E4) ,
          foregroundColor: Colors.white,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>vetLogin()));

          },
          child: Icon(Icons.arrow_back_ios_new,size: 30,),
        ),
      ),
    );
  }
}
