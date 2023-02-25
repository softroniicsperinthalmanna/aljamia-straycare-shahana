
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:straycare_app/screens/vetlogin.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../connection/connect.dart';
import '../../models/model.dart';
import '../../style/style.dart';
class VetCaseCard extends StatefulWidget {
  const VetCaseCard({Key? key}) : super(key: key);

  @override
  State<VetCaseCard> createState() => _VetCaseCardState();
}

class _VetCaseCardState extends State<VetCaseCard> {
  Future<dynamic> getData() async {
    var response=await get(Uri.parse('${Con.url}viewvet.php'));
    print(response.body);
    return json.decode(response.body);
  }
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
      appBar: AppBar(
        title: Text("Reports"),
        centerTitle: true,
        backgroundColor:Color(0xff9088E4)  ,
      ),
      body: Container(
          child: FutureBuilder(
            future: getData(),
            builder: (context,snapshot){
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context,index){
                    // var date = DateTime.parse(snapshot.data[index]['reportedDate']);
                    // var formattedDate = "${date.day}-${date.month}-${date.year}";
                    var time=DateFormat.yMEd().add_jms().format(DateTime.parse(snapshot.data[index]['reportedDate']));
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
                                  padding: const EdgeInsets.only(left: 20.0,top: 10,bottom: 10),
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.person_pin,color:Color(0xff9088E4) ,),
                                            SizedBox(width: 10,),

                                            Text(snapshot.data![index]['name'],
                                              // style:GoogleFonts.poppins(color:Color(0xff9088E4) ,fontSize: 22,fontWeight: FontWeight.bold),)
                                              style:vioBtnHeadPlay,)
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.location_on,color:Color(0xff9088E4) ,),
                                            SizedBox(width: 10,),

                                            Text(snapshot.data![index]['location'],style: normalTextPlay,),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.timer_outlined,color:Color(0xff9088E4) ,),
                                            // SizedBox(width: 10,),
                                            // Text(formattedDate,style: normalText,),
                                            SizedBox(width: 10,),
                                            Text(time,style: normalTextPlay,),
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                ),

                                Center(
                                  child: Container(
                                    height: 300,width: 400,
                                    child:Image(image: NetworkImage("${Con.url}reportCase/${snapshot.data[index]['image']}",),fit:BoxFit.cover,),

                                  ),
                                ),
                                Container(
                                  height: 120,
                                  width:400 ,
                                  child:Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(snapshot.data[index]['description'],style: normalTextPlay,),
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Color(0xff9088E4))
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Center(
                                  child: InkWell(
                                    onTap: (){
                                      Uri launchUri = Uri(scheme: 'tel', path: snapshot.data[index]['phone']);
                                      launchUrl(launchUri);
                                    },
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






                              ]
                          ),
                        ),
                      ),
                    );
                  });
            },


          )
      ),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(bottom: 20.0,),
      //   child: FloatingActionButton(
      //     backgroundColor:Color(0xff9088E4) ,
      //     foregroundColor: Colors.white,
      //     onPressed: (){
      //       Navigator.push(context, MaterialPageRoute(builder: (context)=>vetLogin()));
      //
      //     },
      //     child: Icon(Icons.arrow_back_ios_new,size: 30,),
      //   ),
      // ),
    );
  }
}
