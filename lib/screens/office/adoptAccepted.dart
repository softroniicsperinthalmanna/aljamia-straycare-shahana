import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../connection/connect.dart';

class AdoptAccepted extends StatefulWidget {
  const AdoptAccepted({Key? key}) : super(key: key);

  @override
  State<AdoptAccepted> createState() => _AdoptAcceptedState();
}

class _AdoptAcceptedState extends State<AdoptAccepted> {
  var requestId;
  var status;
  Future getData() async {
    var data = {'officeId': '1'};
    var response = await http.post(Uri.parse("${Con.url}viewAccepted.php"),
        body: data);
    print(response.body);
    if(json.decode(response.body)[0]['result']=='failed'){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Nothing to show...')));
    }
    else {
      // throw Exception('Failed to load data!');
      return json.decode(response.body);

    }
  }

  Future updateAdoptStatus() async {
    var data = {
      'requestId': requestId.toString(),
      'adoptDate': DateTime.now().toString(),
      'status': status
    };
    var response = await http.post(Uri.parse("${Con.url}updateAdoptStatus.php"),
        body: data);
    print(response.body);

    return json.decode(response.body);
  }

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
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return (snapshot.hasData)
                ? ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  List list = snapshot.data;
                  requestId = list[index]['reqId'];
                  return ListView(
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ListTile(
                          leading: Container(
                            height: 100,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Colors.teal,
                                image: DecorationImage(
                                    image: NetworkImage(

                                      "${Con.url}reportCase/${list[index]['image']}",
                                    ),
                                    fit: BoxFit.fill)),
                          ),
                          title: Text('Request ID: #${list[index]['reqId']}'),
                          subtitle:
                          Text('User ID: #${list[index]['userId']}'),
                          trailing:
                  list[index]['status']=='pending'?
                          TextButton(

                            onPressed: (){
                              showDialog(context: context, builder: (context){
                                return AlertDialog(
                                  icon: Icon(Icons.question_mark_sharp,color: Colors.amber,size: 40,),
                                  content: Text("Successfully Adopted by:\n ${list[index]['Username']} (#${list[index]['userId']}) \n ${list[index]['address']}  "),
                                  actions: [
                                    OutlinedButton(onPressed: (){
                                      status="completed";
                                      print(status);
                                      print(requestId);
                                      print(DateTime.now);
                                      updateAdoptStatus();
                                      setState(() {
getData();
                                      });
                                      Navigator.pop(context);
                                    }, child: Text('Yes')),
                                    OutlinedButton(onPressed: (){
                                      Navigator.pop(context);
                                    }, child: Text('No')),
                                  ],
                                );
                              });
                            },
                            child: Text('Pending'),
                          ):Text('Completed',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                        ),
                      ),
                      // ButtonBar(
                      //   children: [
                      //     OutlinedButton(
                      //         onPressed: () {
                      //           status = 'completed';
                      //
                      //           setState(() {
                      //             updateAdoptStatus();
                      //           });
                      //         },
                      //         child: Text('pending')),
                      //     OutlinedButton(
                      //         onPressed: () {
                      //           status = 'cancelled';
                      //
                      //           setState(() {
                      //             updateAdoptStatus();
                      //           });
                      //         },
                      //         child: Text('Decline')),
                      //   ],
                      // )
                    ],
                  );
                })
                : Center(
              child: Text('Nothing to show'),
            );
          },
        ),
      ),
    );
  }
}
