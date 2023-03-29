import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:straycare_app/screens/User/Adopt/toAdoptDetailPage.dart';
import 'package:straycare_app/screens/User/Adopt/viewMyRequest.dart';
import 'package:straycare_app/screens/User/Findpet/missingIndividual.dart';

import '../../../connection/connect.dart';
import '../../../style/style.dart';

class ListToAdopt extends StatefulWidget {
   ListToAdopt({Key? key,required this.uid}) : super(key: key);
var uid;
  @override
  State<ListToAdopt> createState() => _ListToAdoptState();
}

class _ListToAdoptState extends State<ListToAdopt> {
  //display data
  var flag;
  Future getData() async {
    var response = await http.get(Uri.parse("${Con.url}viewToAdoptList.php"));
    print(response.body);
    var res2=jsonDecode(response.body)[0]['result'];
    print('result is : $res2');
    res2=="success"
        ?flag=1
        :flag=0;
    return jsonDecode(response.body);
  }

  @override
  void initState() {
    super.initState();
    //  print('two:${widget.indexNo}');
    // print('cat inside init:$category');
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: vio,
        backgroundColor: Colors.white,
        title: Text(
          'Adopt',
          style: subHead,
        ),
        centerTitle: true,
        actions: [
          // TextButton(
          //     onPressed: () {
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => MyRequests(
          //             uid: widget.uid,
          //           )));
          //     },
          //     child: Text('My Requests')),
        ],
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.hasError)print('Error:${snapshot.error}');
            print('Inside toAdopt list: ${snapshot.hasData}');
            if(!snapshot.hasData) {
              return const Center(child: Text('No Data..'),);
            }
            return flag==0?Center(child: Text('Nothing to show')):
              snapshot.hasData
                ? Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 1,
                        crossAxisSpacing: 1,
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        List list = snapshot.data;
                        return InkWell(
                          onTap: () {
                            print(list[index]['location']);
                            print(list[index]['animal']);
                            print(list[index]['description']);
                            print(list[index]['gender']);
                            print(list[index]['type']);
                            print(list[index]['color']);
                            print(list[index]['breed']);
                            print(list[index]['collected_on']);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ToAdoptDetailPage(
                                      uid: widget.uid,
                                          image: list[index]['image'],
                                          animal: list[index]['type'],
                                          desc: list[index]['description'],
                                          gender: list[index]['gender'],
                                          loc: list[index]['office'],
                                          breed: list[index]['breed'],
                                          color: list[index]['color'],
                                          animalID: list[index]['animalID'],
                                          officeId: list[index]['officeID'],
                                        )));
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>MissingDetailPage(
                            //
                            //   image: list[index]['image'],
                            //   name: list[index]['name'],
                            //   animal: list[index]['animal'],
                            //   desc:list[index]['description'],
                            //   gender:list[index]['gender'],
                            //   loc:list[index]['location'],
                            //   breed:list[index]['breed'],
                            //   color:list[index]['animalColor'],
                            //   miss_date:list[index]['missingDate'],
                            //   report_date:list[index]['reportedDate'],
                            //
                            // )));
                          },
                          child: Hero(
                            tag: index,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(35)),
                                // generate blues with random shades
                                // color: Colors.pink[Random().nextInt(2) * 100],
                                color: Colors.white54,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    height: 250,
                                    // decoration: BoxDecoration(
                                    //     borderRadius: BorderRadius.circular(50)
                                    // ),
                                    child: Image.network(
                                      "${Con.url}reportCase/${list[index]['image']}",
                                      fit: BoxFit.fill,
                                    ),
                                    // child: Column(
                                    //   children: [
                                    //     Container(
                                    //       height: MediaQuery.of(context).size.height*0.35,
                                    //       width: MediaQuery.of(context).size.width,
                                    //
                                    //       child: Image.network(
                                    //         "${Con.url}reportCase/${list[index]['image']}",fit: BoxFit.fill,),
                                    //       // child:
                                    //       // Center(
                                    //       //   child: Text(
                                    //       //     artCatelog[index]['name'],
                                    //       //     style: TextStyle(color:Colors.white,
                                    //       //         fontWeight: FontWeight.bold,fontSize: 30),),),
                                    //
                                    //     ),
                                    //     // Container(
                                    //     //   height: 50,
                                    //     //   color: Colors.white,
                                    //     //   child:Center(
                                    //     //     child: Text(
                                    //     //         list[index]['name'].toUpperCase(),
                                    //     //         style: normalTextPlay
                                    //     //     )
                                    //     //
                                    //     //     ,),
                                    //     //
                                    //     // ),
                                    //
                                    //   ],
                                    // ),
                                  ),
                                )),
                          ),
                        );
                      },
                      itemCount: snapshot.data.length,
                    ),
                  )
                : Center(child: CircularProgressIndicator());
          }),

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
