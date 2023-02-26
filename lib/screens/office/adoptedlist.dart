import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:straycare_app/models/model.dart';
import 'package:straycare_app/screens/office/fosteringDetailPage.dart';
import 'package:straycare_app/screens/office/collectionDetailPage.dart';
import 'package:straycare_app/screens/office/viewlist.dart';

import '../../connection/connect.dart';
import '../../style/style.dart';
import 'adoptedDetailPage.dart';
import 'collectedindividual.dart';
class AdoptedList extends StatefulWidget {
  const AdoptedList({Key? key}) : super(key: key);

  @override
  State<AdoptedList> createState() => _AdoptedListState();
}

class _AdoptedListState extends State<AdoptedList> {
  var reason=TextEditingController();

  var animalID;
  Future getData() async {

    var data={
      'officeId':'1'
    };

    var response = await http.post(Uri.parse("${Con.url}viewAdoptedList.php"),body: data);
    print(response.body);
if(jsonDecode(response.body)[0]['result']=='success'){
  return jsonDecode(response.body);
}

else {
  throw Exception(e.toString());
}

  }


  @override
  void initState(){
    super.initState();
    //  print('two:${widget.indexNo}');
    // print('cat inside init:$category');
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(

        body: Container(
          child: SingleChildScrollView(
            child: Column(

              children: [


                // Padding(
                //   padding: const EdgeInsets.only(left:20,top:5.0,right: 20,bottom: 10),
                //   child: Container(
                //     height: 45,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(20)
                //     ),
                //     // child: TextFormField(
                //     //   decoration:InputDecoration(
                //     //     hintText: "Search",
                //     //     hintStyle: TextStyle(color: Color(0xff9088E4)),
                //     //     prefixIcon: Icon(Icons.search),
                //     //     enabledBorder: OutlineInputBorder(
                //     //         borderRadius: BorderRadius.circular(20),
                //     //         borderSide: BorderSide(
                //     //             color: Color(0xff9088E4)
                //     //         )
                //     //     ),
                //     //     focusedBorder: OutlineInputBorder(
                //     //         borderRadius: BorderRadius.circular(20),
                //     //
                //     //         borderSide: BorderSide(
                //     //             color: Color(0xff9088E4)
                //     //         )
                //     //
                //     //     ),
                //     //
                //     //   ),
                //     // ),
                //   ),
                // ),
                Container(
                  height: 700,

                  child: FutureBuilder(
                    future: getData(),
                    builder: (context,snapshot){
                      print(snapshot.hasData);
                      if (snapshot.hasError) print(snapshot.error);
                      return snapshot.hasData?GridView.builder(
                          itemCount: snapshot.data.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 4,
                            childAspectRatio: 0.6,
                          ),


                          itemBuilder: (context,index){
                            List list=snapshot.data;
                            return InkWell(

                              onTap: (){
                                //print(list[index]['name']);
                                print(list[index]['animaltype']);
                                print(list[index]['description']);
                                print(list[index]['gender']);
                                print(list[index]['animalId']);
                                print(list[index]['color']);
                                print(list[index]['adoptedOn']);
                                print(list[index]['status']);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>AdoptedDetailPage(
                                    adoptedOn: list[index]['adoptedOn'],
                                    image: list[index]['image'],
                                    type: list[index]['animaltype'],
                                    desc: list[index]['description'],
                                    gender: list[index]['gender'],
                                    reqID: list[index]['reqId'],
                                    animalID: list[index]['animalId'],
                                    breed: list[index]['breed'],
                                    color: list[index]['color'],
                                    userID: list[index]['userId'],
                                    address: list[index]['address'],
                                    adoptedBy: list[index]['adoptedBy'],
                                    phone: list[index]['phone'],

                                )));
                              },
                              child: Hero(
                                tag: index,
                                child: Card(
                                  // generate blues with random shades
                                    color: Colors.purple[Random().nextInt(2) * 100],
                                    child: Padding(
                                      padding: const EdgeInsets.all( 12),
                                      child: Container(
                                        height: 250,
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 240,
                                              width: MediaQuery.of(context).size.width,
                                              child: Image.network(
                                                "${Con.url}reportCase/${list[index]['image']}",fit: BoxFit.fill,),
                                              // child:
                                              // Center(
                                              //   child: Text(
                                              //     artCatelog[index]['name'],
                                              //     style: TextStyle(color:Colors.white,
                                              //         fontWeight: FontWeight.bold,fontSize: 30),),),

                                            ),
                                            Container(
                                              height: 50,
                                              color: Colors.white,
                                              child:Center(
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Text("#${list[index]['animalId']}",
                                                        style: normalTextPlay
                                                    ),
                                                  ],
                                                )

                                                ,),

                                            ),

                                          ],
                                        ),
                                      ),
                                    )
                                ),
                              ),
                            );
                          })
                          :Center(child: Text('Nothing to show'));
                    },


                  ),
                ),
              ],
            ),
          ),
        ),
        // floatingActionButton: Padding(
        //   padding: const EdgeInsets.only(bottom: 250.0,right: 20,left: 1),
        //   child: FloatingActionButton(
        //     backgroundColor:Color(0xff9088E4) ,
        //     foregroundColor: Colors.white,
        //     onPressed: (){
        //       Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewList()));
        //
        //     },
        //     child: Icon(Icons.arrow_back_ios_new,size: 30,),
        //   ),
        // ),

      ),
    );
  }
}
