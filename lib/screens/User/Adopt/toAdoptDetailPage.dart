import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:straycare_app/screens/office/viewlist.dart';

import '../../../connection/connect.dart';
import '../../../style/style.dart';

class ToAdoptDetailPage extends StatefulWidget {
  // var name;
  var animal;
  var desc;
  var gender;
  var loc;//office location
  var breed;
  var color;
  // var miss_date;
  // var report_date;
  var image;
  var animalID;
  var officeId;

  ToAdoptDetailPage({Key? key,required this.image,required this.animalID,required this.officeId,required this.animal,required this.desc,required this.gender,required this.loc,required this.breed,required this.color}) : super(key: key);

  @override
  State<ToAdoptDetailPage> createState() => _ToAdoptDetailPageState();
}

class _ToAdoptDetailPageState extends State<ToAdoptDetailPage> {
  var flag=0;
  Future sendRequest() async {
    var data={
      'userId':'8',
      'animalId':widget.animalID.toString(),
      'officeId':widget.officeId.toString(),
      'sendDate':DateTime.now().toString(),


    };

    var response = await http.post(Uri.parse("${Con.url}sendAdoptRequest.php"),body: data);
    print(response.body);

    return json.decode(response.body);

  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children:[
              Positioned(
                top: 0,

                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight:Radius.circular(30),
                      ),
                      image: DecorationImage(
                        image:  NetworkImage('${Con.url}reportCase/${widget.image}'),fit: BoxFit.cover,

                      ),
                      color: vio
                  ),
                  height: 330,
                  width: MediaQuery.of(context).size.width,
                  //  child: Image(image: NetworkImage('${Con.url}reportCase/${widget.image}'),fit: BoxFit.cover,)
                  //  ),
                ),
              ),
              Positioned(
                top: 300,

                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 320,
                    width:380 ,

                    decoration: BoxDecoration(
                      color: Colors.black87,
                      border: Border.all(
                          color: Colors.amber,
                          width: 1
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child:DataTable (
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      // clipBehavior:Clip.none,
                      columnSpacing:3,
                      dataRowHeight:43,

                      //  border: TableBorder.all(color: vio,),
                      columns: [
                        DataColumn(label: Text('Breed',style: whitenormal13,)),
                        DataColumn(label: Text(widget.breed,style: whitenormal13,)),


                      ],
                      rows: [

                        DataRow(cells: [
                          DataCell(Text('Description ',style: whitenormal13,)),
                          DataCell(Text(': ${widget.desc}',style: whitenormal13,)),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Gender ',style: whitenormal13,)),
                          DataCell(Text(': ${widget.gender}',style: whitenormal13,)),
                        ]),

                        DataRow(cells: [
                          DataCell(Text('Animal Type ',style: whitenormal13,)),
                          DataCell(Text(': ${widget.animal}',style: whitenormal13,)),
                        ]),

                        DataRow(cells: [
                          DataCell(Text('Color ',style: whitenormal13,)),
                          DataCell(Text(': ${widget.color}',style: whitenormal13,)),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Office ',style: whitenormal13,)),
                          DataCell(Text(': ${widget.loc}',style: whitenormal13,)),
                        ]),






                      ],



                    ),    ),
                ),
              ),




              Positioned(
                top: 650,
                left: 100,
                child: Container(
                    width: 250,
                    height: 55,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: Colors.black87,
                        ),
                        backgroundColor: Colors.black38,
                      ),
                      // side: BorderSide(color: vio)),
                      onPressed: (){
                        setState(() {

                        });
                        showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                actionsAlignment:MainAxisAlignment.center,
                                icon: Icon(Icons.info_outline_rounded,size: 50,),
                                iconColor: Colors.amber,
                                content: Text('Are you sure that you want to adopt this animal?'),
                                actions: [
                                  OutlinedButton(onPressed: (){
                                    setState(() {

                                    });
                                    flag=1;
                                    sendRequest();
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Requested...')));
                                      Navigator.pop(context);
                                  }, child: Text('Yes',style: rednormal13,)),
                                  OutlinedButton(onPressed: (){
                                    Navigator.pop(context);
                                  }, child: Text('No',style: rednormal13,)),
                                ],
                              );
                            });
                      },
                      child: Center(
                        child: flag==0?Text(
                          'Send a request to Adopt',
                          style: GoogleFonts.poppins(color: Colors.black87,),
                        ):Text(
                          'requested',
                          style: GoogleFonts.poppins(color: Colors.red,),
                        )
                      ),

                    )
                ),
              ),









            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor:Color(0xff9088E4) ,
        //   foregroundColor: Colors.white,
        //   onPressed: (){
        //     Navigator.pop(context);
        //
        //   },
        //   child: Icon(Icons.arrow_back_ios_new,size: 30,),
        // ),
      ),
    );

  }
}
