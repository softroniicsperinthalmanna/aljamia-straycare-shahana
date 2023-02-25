import 'dart:convert';

 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:straycare_app/screens/forest/forestLogin.dart';

import '../../auth/login.dart';
import '../../connection/connect.dart';
import '../../models/model.dart';
import '../../style/style.dart';
class forestCaseCard extends StatefulWidget {
  const forestCaseCard({Key? key}) : super(key: key);

  @override
  State<forestCaseCard> createState() => _forestCaseCardState();
}

class _forestCaseCardState extends State<forestCaseCard> {
  Future<dynamic> getData() async {
 var response=await get(Uri.parse('${Con.url}viewwild.php'));
 print(response.body);
 return json.decode(response.body);
  }
@override
void initState(){
    super.initState();
    getData();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: FutureBuilder(
            future: getData(),
            builder: (context,snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                    itemCount: snapshot.data.length,
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
                                              height: 200,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                              ListTile(
                                                leading:Icon(Icons.person_pin,color:Color(0xff9088E4) ,),

                                                  title:Text(snapshot.data[index]['name'],
                                                    style:GoogleFonts.poppins(color:Color(0xff9088E4) ,fontSize: 22,fontWeight: FontWeight.bold),),
                                              ), ListTile(
                                                leading:Icon(Icons.location_on,color:Color(0xff9088E4) ,),

                                                  title:Text(snapshot.data[index]['location'],
                                                    style:normalText),
                                              ), ListTile(
                                                leading:Icon(Icons.timer_outlined,color:Color(0xff9088E4) ,),

                                                  title:Text(snapshot.data[index]['reportedDate'],
                                                    style:normalText),
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
                                    child:
                                      Image.network(
                                        "${Con.url}reportCase/${snapshot.data[index]['image']}",fit: BoxFit.fill,),
                                      ),

                                  Container(
                                    height: 120,
                                    width: MediaQuery.of(context).size.width,
                                    child:Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text(snapshot.data[index]['description'],style: normalText),
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
                    });

              }
              else
              // return Center(child: CircularProgressIndicator());
              return Center(child: Text('No Data found !'));
            },

          )
      ),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(bottom: 250.0,right: 20,left: 1),
      //   child: FloatingActionButton(
      //     backgroundColor:Color(0xff9088E4) ,
      //     foregroundColor: Colors.white,
      //     onPressed: (){
      //       Navigator.push(context, MaterialPageRoute(builder: (context)=>Login(
      //         type: widget.type,
      //       )));
      //     },
      //     child: Icon(Icons.arrow_back_ios_new,size: 30,),
      //   ),
      // ),

    );
  }
}
