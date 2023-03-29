import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:straycare_app/screens/boarding/loginIndex.dart';
import 'package:straycare_app/screens/location/map.dart';
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
  var flag;
  var _selectedItem;
  Future<dynamic> getData() async {
    var response = await get(Uri.parse('${Con.url}viewvet.php'));
    print(response.body);
    var res2 = jsonDecode(response.body)[0]['result'];
    print('result is : $res2');
    res2 == "success" ? flag = 1 : flag = 0;
    return jsonDecode(response.body);

    //
    // return json.decode(response.body);
  }

  Future<void> phoneDialog() async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            // <-- SEE HERE
            //  title: const Text('Select Booking Type'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Column(
                  children: [
                    Text('pmna'),
                    TextButton(
                      child: Text('9078256575'),
                      onPressed: () {
                        Uri launchUri = Uri(scheme: 'tel', path: '9078256575');
                        launchUrl(launchUri);
                      },
                    ),
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Column(
                  children: [
                    Text('mlpm'),
                    TextButton(
                      child: Text('897256575'),
                      onPressed: () {
                        Uri launchUri = Uri(scheme: 'tel', path: '897256575');
                        launchUrl(launchUri);
                      },
                    ),
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Column(
                  children: [
                    Text('kzhkd'),
                    TextButton(
                      child: Text('908756575'),
                      onPressed: () {
                        Uri launchUri = Uri(scheme: 'tel', path: '908756575');
                        launchUrl(launchUri);
                      },
                    ),
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
          print('Inside veterinery case card: ${snapshot.hasData}');
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
                    // var date = DateTime.parse(snapshot.data[index]['reportedDate']);
                    // var formattedDate = "${date.day}-${date.month}-${date.year}";

                    var reportedDate = snapshot.data[index]['reportedOn'];
                    var time = reportedDate != null
                        ? DateFormat.yMEd()
                            .add_jms()
                            .format(DateTime.parse(reportedDate))
                        : '';

                    // var time=DateFormat.yMEd().add_jms().format(DateTime.parse(snapshot.data[index]['reportedOn']));
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Color(0xffd4ecfa),
                        elevation: 10,
                        child: Container(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 10, bottom: 10),
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.person_pin,
                                              color: Color(0xff9088E4),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              snapshot.data![index]['reporter'],
                                              // style:GoogleFonts.poppins(color:Color(0xff9088E4) ,fontSize: 22,fontWeight: FontWeight.bold),)
                                              style: vioBtnHeadPlay,
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              color: Color(0xff9088E4),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  var mapLat;
                                                  mapLat = double.parse(snapshot
                                                      .data[index]['lati']);
                                                  var mapLong;
                                                  mapLong = double.parse(
                                                      snapshot.data[index]
                                                          ['longi']);

                                                  MapUtils.openMap(
                                                      mapLat, mapLong);
                                                },
                                                child: Text(
                                                  snapshot.data![index]
                                                      ['location'],
                                                  style: locationText,
                                                )),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.timer_outlined,
                                              color: Color(0xff9088E4),
                                            ),
                                            // SizedBox(width: 10,),
                                            // Text(formattedDate,style: normalText,),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              time,
                                              style: normalText,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    height: 300,
                                    width: 400,
                                    child: Image(
                                      image: NetworkImage(
                                        "${Con.url}reportCase/${snapshot.data[index]['image']}",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 120,
                                  width: 400,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      snapshot.data[index]['description'],
                                      style: normalTextPlay,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xff9088E4))),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Center(
                                  child: InkWell(
                                    onTap: () {
                                      Uri launchUri = Uri(
                                          scheme: 'tel',
                                          path: snapshot.data[index]['phone']);
                                      launchUrl(launchUri);
                                    },
                                    child: Container(
                                      height: 65,
                                      width: 290,
                                      decoration: btnDecoration,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
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
                                  height: 5,
                                ),
                                Center(
                                  child: InkWell(
                                    onTap: () {
                                      phoneDialog();
                                    },
                                    child: Container(
                                      height: 65,
                                      width: 290,
                                      decoration: btnDecoration,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
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
                                            Text('Call StrayCare',
                                                style: btnText),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ]),
                        ),
                      ),
                    );
                  });
        },
      )),
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
