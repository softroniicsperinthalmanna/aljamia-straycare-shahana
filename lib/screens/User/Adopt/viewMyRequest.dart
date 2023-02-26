import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../connection/connect.dart';


class MyRequests extends StatefulWidget {
  const MyRequests({Key? key}) : super(key: key);

  @override
  State<MyRequests> createState() => _MyRequestsState();
}

class _MyRequestsState extends State<MyRequests> {
  var requestId;
  var reply;
  Future getData() async {
    var data = {'userID': '8'};
    var response = await http.post(Uri.parse("${Con.url}viewMyRequest.php"),
        body: data);
    print(response.body);

      return json.decode(response.body);


  }

  // Future updateRequest() async {
  //   var data = {
  //     'requestId': requestId.toString(),
  //     'replyDate': DateTime.now().toString(),
  //     'reply': reply
  //   };
  //   var response = await http.post(Uri.parse("${Con.url}updateRequest.php"),
  //       body: data);
  //   print(response.body);
  //
  //   return json.decode(response.body);
  // }

  @override
  void initState() {
    super.initState();
    getData();
    setState(() {

    });

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('My Requests',style: TextStyle(color: Color(0xff9088E4),fontSize: 30),),
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return (snapshot.hasData)
                ? Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListView.separated(
              separatorBuilder: (context,index){
                  return Divider();
              },

                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    List list = snapshot.data;
                    var sdate = DateTime.parse(list[index]['send_date']);
                    var formattedSDate = "${sdate.day}-${sdate.month}-${sdate.year}";
                    var rdate;
                    var formattedRDate;
                    
                    if(list[index]['reply_date']!= "" ) {
                       rdate = DateTime.parse(list[index]['reply_date']);
                      formattedRDate = "${rdate.day}-${rdate.month}-${rdate
                          .year}";
                    }

                    requestId = list[index]['req_id'];
                    return ListView(
                      shrinkWrap: true,
                      children: [
                        ListTile(
                          leading: Container(
                            height: 150,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Colors.teal,
                                image: DecorationImage(
                                    image: NetworkImage(

                                      "${Con.url}reportCase/${list[index]['image']}",
                                    ),
                                    fit: BoxFit.fill)),
                          ),
                          title: Text('#${list[index]['req_id']}'),
                          subtitle:
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Breed : ${list[index]['breed']}'),
                              Text('Send : ${formattedSDate}'),
                             // Text(list[index]['reply_date']==''?'Replied : ':'Replied : ${formattedRDate}'),
                              list[index]['reply_date']=='0000-00-00 00:00:00'? Text('Replied : Waiting'):Text('Replied : ${formattedRDate}')

                            ],
                          ),
                          trailing: Container(
                            height: 40,
                            width: 100,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10) ,
                              color: Colors.red,
                            ),
                            child: Center(
                              child: Text(
                                  list[index]['reply_status'],style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        // ButtonBar(
                        //   children: [
                        //     OutlinedButton(
                        //         onPressed: () {
                        //           reply = 'accepted';
                        //
                        //           setState(() {
                        //           //  updateRequest();
                        //           });
                        //         },
                        //         child: Text('Accept')),
                        //     OutlinedButton(
                        //         onPressed: () {
                        //           reply = 'declined';
                        //
                        //           setState(() {
                        //           //  updateRequest();
                        //           });
                        //         },
                        //         child: Text('Decline')),
                        //   ],
                        // )
                      ],
                    );
                  }),
                )
                : Center(
              child: Text('No Request Found'),
            );
          },
        ),
      ),
    );
  }
}
