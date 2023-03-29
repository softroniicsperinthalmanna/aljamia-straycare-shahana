import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:straycare_app/screens/location/map.dart';
import 'package:straycare_app/screens/police/policelogin.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../connection/connect.dart';
import '../../models/model.dart';
import '../../style/style.dart';
import '../boarding/loginIndex.dart';

class policeCaseCard extends StatefulWidget {
  const policeCaseCard({Key? key}) : super(key: key);

  @override
  State<policeCaseCard> createState() => _policeCaseCardState();
}

class _policeCaseCardState extends State<policeCaseCard> {
  var flag;
  var _selectedItem;

  Future<dynamic> getData() async {
    var response = await get(Uri.parse('${Con.url}viewabuse.php'));
    print(response.body);
    var res2 = jsonDecode(response.body)[0]['result'];
    print('result is : $res2');
    res2 == "success" ? flag = 1 : flag = 0;
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text('Do you want to LogOut ?'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginIndex()));
                            },
                            child: Text('Yes')),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('No')),
                      ],
                    );
                  });
            },
            icon: Icon(Icons.arrow_back_outlined)),
        title: Text("Reports"),
        centerTitle: true,
        backgroundColor: Color(0xff9088E4),
        actions: [
          PopupMenuButton(
              onSelected: (item) {
                setState(() {
                  _selectedItem = item;
                });

                switch (_selectedItem) {
                  case 'logout':
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginIndex()));
                    break;
                }
              },
              icon: Icon(Icons.logout),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(value: 'logout', child: Text('LogOut')),
                ];
              }),
        ],
      ),

      body: Container(
          child: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print('Error:${snapshot.error}');
                print('Inside Police case card: ${snapshot.hasData}');
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text('No Data..'),
                  );
                }
                return flag == 0
                    ? Center(child: Text('Nothing to show'))
                    : ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          var reportedDate = snapshot.data[index]['reportedOn'];
                          var time = reportedDate != null
                              ? DateFormat.yMEd()
                                  .add_jms()
                                  .format(DateTime.parse(reportedDate))
                              : '';

                          return Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Card(
                              color: Color(0xffd4ecfa),
                              elevation: 10,
                              child: Container(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 40.0, top: 10, bottom: 10),
                                        child: Container(
                                          height: 200,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ListTile(
                                                leading: Icon(
                                                  Icons.person_pin,
                                                  color: Color(0xff9088E4),
                                                ),
                                                title: Text(
                                                  snapshot.data[index]
                                                      ['reporter'],
                                                  style: GoogleFonts.poppins(
                                                      color: Color(0xff9088E4),
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              ListTile(
                                                leading: Icon(
                                                  Icons.location_on,
                                                  color: Color(0xff9088E4),
                                                ),
                                                title: InkWell(
                                                  onTap: () {
                                                    var mapLat;
                                                    mapLat = double.parse(
                                                        snapshot.data[index]
                                                            ['lati']);
                                                    var mapLong;
                                                    mapLong = double.parse(
                                                        snapshot.data[index]
                                                            ['longi']);

                                                    MapUtils.openMap(
                                                        mapLat, mapLong);
                                                  },
                                                  child: Text(
                                                      snapshot.data[index]
                                                          ['location'],
                                                      style: locationText),
                                                ),
                                              ),
                                              ListTile(
                                                leading: Icon(
                                                  Icons.timer_outlined,
                                                  color: Color(0xff9088E4),
                                                ),
                                                title: Text(time,
                                                    style: normalText),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: InkWell(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    icon: Icon(
                                                      Icons.phone,
                                                      color: Colors.blue,
                                                    ),
                                                    content:
                                                        Text('Make a Call'),
                                                    actions: [
                                                      TextButton(
                                                          onPressed: () {
                                                            Uri launchUri = Uri(
                                                                scheme: 'tel',
                                                                path: snapshot
                                                                            .data![
                                                                        index]
                                                                    ['phone']);
                                                            launchUrl(
                                                                launchUri);
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text('sure')),
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text('cancel'))
                                                    ],
                                                  );
                                                });
                                          },
                                          child: Container(
                                            height: 65,
                                            width: 290,
                                            decoration: btnDecoration,
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.phone,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),
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
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 338,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Image.network(
                                          "${Con.url}reportCase/${snapshot.data[index]['image']}",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Container(
                                        height: 120,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Text(
                                              snapshot.data[index]
                                                  ['description'],
                                              style: normalText),
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color(0xff9088E4))),
                                      ),
                                    ]),
                              ),
                            ),
                          );
                        });
              }
              // else
              //   // return Center(child: CircularProgressIndicator());
              //   return Center(child: Text('No Data found !'));
              // },

              )),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(bottom: 250.0,right: 20,left: 1),
      //   child: FloatingActionButton(
      //     backgroundColor:Color(0xff9088E4) ,
      //     foregroundColor: Colors.white,
      //     onPressed: (){
      //     Navigator.push(context, MaterialPageRoute(builder: (context)=>policelogin()));
      //     },
      //     child: Icon(Icons.arrow_back_ios_new,size: 30,),
      //   ),
      // ),
    );
  }
}
