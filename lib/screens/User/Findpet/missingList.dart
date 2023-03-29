import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:straycare_app/screens/User/Findpet/missingIndividual.dart';

import '../../../connection/connect.dart';
import '../../../style/style.dart';
class MissingPet extends StatefulWidget {
 const MissingPet({Key? key}) : super(key: key);


  @override
  State<MissingPet> createState() => _MissingPetState();
}

class _MissingPetState extends State<MissingPet> {
  //display data
  Future getData() async {



    var response = await http.get(Uri.parse("${Con.url}viewmissing.php"));
    print(response.body);

    return json.decode(response.body);


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
    return Scaffold(
      appBar:AppBar(
        foregroundColor: vio,
        backgroundColor: Colors.white,

        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: (){
            Navigator.pop(context);
          },

        ),
        title: Text('Missing Pets',style: subHead,),
        centerTitle: true,
        actions: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: IconButton(onPressed: (){},  icon: Icon(Icons.home)),
          // )
        ],

      ),
      body:             FutureBuilder(
          future: getData(),
          builder: (BuildContext context,AsyncSnapshot snapshot){
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData?GridView.builder(

              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                childAspectRatio: 0.6,
              ),
              itemBuilder:(BuildContext context,int index) {

                List list = snapshot.data;
                return InkWell(
                  onTap: (){
                    print(list[index]['name']);
                    print(list[index]['animal']);
                    print(list[index]['description']);
                    print(list[index]['gender']);
                    print(list[index]['location']);
                    print(list[index]['animalColor']);
                    print(list[index]['missingDate']);
                    print(list[index]['reportedDate']);

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MissingDetailPage(

                        image: list[index]['image'],
                        name: list[index]['name'],
                    animal: list[index]['animal'],
                    desc:list[index]['description'],
                    gender:list[index]['gender'],
                    loc:list[index]['location'],
                    breed:list[index]['breed'],
                    color:list[index]['animalColor'],
                    miss_date:list[index]['missingDate'],
                    report_date:list[index]['reportedDate'],

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
                                    "${Con.url}missingCase/${list[index]['image']}",fit: BoxFit.fill,),
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
                                    child: Text(
                                        list[index]['name'].toUpperCase(),
                                      style: normalTextPlay
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
              },
              itemCount:snapshot.data.length,


            )
                :Center(child: CircularProgressIndicator());



          }

      ),


      // body: CustomScrollView(
      //   // floatHeaderSlivers: true,
      //     slivers:<Widget>    [
      //       SliverAppBar(
      //         backgroundColor:Color(0xff458F9D) ,
      //         flexibleSpace: FlexibleSpaceBar(
      //
      //           background: Container(
      //             height: 200,
      //             decoration: BoxDecoration(
      //               // color: Color(0xff458F9D),
      //               image: DecorationImage(
      //                 image: AssetImage("assets/images/art/calligraphy.png"),
      //                 fit: BoxFit.fill,
      //               ),
      //             ),
      //             // child: Container(
      //             //   padding: EdgeInsets.all(16.0),
      //             //   alignment: Alignment.centerLeft,
      //             //   child: Text(
      //             //     'Title',
      //             //     style: TextStyle(color: Colors.white, fontSize: 36.0),
      //             //   ),
      //             // ),
      //           ),
      //         ),
      //         // title: const Text('Title'),
      //         floating: true,
      //         //  pinned: true,
      //         expandedHeight: 180.0,
      //
      //         // bottom: AppBar(
      //         //   backgroundColor: Colors.red,
      //         //   toolbarHeight: 64.0,
      //         // ),
      //       ),
      //       FutureBuilder<dynamic>(
      //         future: viewCalligraphy(),
      //         builder: (BuildContext context,AsyncSnapshot snapshot){
      //           if (snapshot.hasError) print(snapshot.error);
      //           return snapshot.hasData?SliverGrid(
      //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //               crossAxisCount: 2,
      //               mainAxisSpacing: 4,
      //               crossAxisSpacing: 4,
      //               childAspectRatio: 0.6,
      //             ),
      //             delegate: SliverChildBuilderDelegate(
      //
      //                   (BuildContext context,int index) {
      //
      //                     List list = snapshot.data;
      //                 return Card(
      //                   // generate blues with random shades
      //                     color: Colors.amber[Random().nextInt(4) * 100],
      //                     child: Padding(
      //                       padding: const EdgeInsets.all( 12),
      //                       child: Container(
      //                         height: 250,
      //                         child: Column(
      //                           children: [
      //                             Container(
      //                               height: 240,
      //                               width: MediaQuery.of(context).size.width,
      //                               // child: Image.network(
      //                               //     "${Con.url}artUploads/${list[index]['image']}",fit: BoxFit.cover,),
      //                               // child:
      //                               // Center(
      //                               //   child: Text(
      //                               //     artCatelog[index]['name'],
      //                               //     style: TextStyle(color:Colors.white,
      //                               //         fontWeight: FontWeight.bold,fontSize: 30),),),
      //
      //                             ),
      //                             Container(
      //                               height: 50,
      //                               color: Colors.white,
      //                               child:Center(
      //                                 child: Text(
      //                                   'ID204',
      //                                   style: TextStyle(color: Color(0xff458F9D),
      //                                       fontWeight: FontWeight.bold,fontSize: 18),),),
      //
      //                             ),
      //
      //                           ],
      //                         ),
      //                       ),
      //                     )
      //                 );
      //               },
      //               childCount:snapshot.data.length,
      //
      //
      //             ),
      //           ):Center(child: CircularProgressIndicator());
      //
      //
      //
      //         }
      //
      //       ),
      //       // SliverList(
      //       //
      //       //   delegate: SliverChildBuilderDelegate(
      //       //     childCount:artCatelog.length,
      //       //         (BuildContext context, int index) {
      //       //       return Padding(
      //       //         padding: const EdgeInsets.only(left: 12.0,right: 12,top: 12),
      //       //         child: Container(
      //       //           height: 170,
      //       //           width: MediaQuery.of(context).size.width,
      //       //           decoration: BoxDecoration(
      //       //             image: DecorationImage(
      //       //
      //       //               image: AssetImage(
      //       //                 "assets/images/art/"+ artCatelog[index]['image'],),
      //       //               fit: BoxFit.fitWidth,
      //       //               // opacity: 0.4
      //       //             ),
      //       //
      //       //           ),
      //       //           child:
      //       //           Center(
      //       //             child: Text(
      //       //               artCatelog[index]['name'],
      //       //               style: TextStyle(color:Colors.white,
      //       //                   fontWeight: FontWeight.bold,fontSize: 30),),),
      //       //
      //       //         ),
      //       //       );
      //       //     },
      //       //   ),
      //       // ),
      //
      //       // ListView.builder(
      //       //   padding: const EdgeInsets.all(8),
      //       //   itemCount: 30,
      //       //   itemBuilder: (BuildContext context, int index) {
      //       //     return Container(
      //       //       height: 50,
      //       //       child: Center(child: Text('Item $index')),
      //       //     );
      //       //   },
      //       // ),
      //     ]
      // ),

    );
  }
}
