import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../connection/connect.dart';

class ToAdoptRequests extends StatefulWidget {
   ToAdoptRequests({Key? key,required this.uid}) : super(key: key);
  var uid;
  @override
  State<ToAdoptRequests> createState() => _ToAdoptRequestsState();
}

class _ToAdoptRequestsState extends State<ToAdoptRequests> {
  var requestId;
  var reply;
  Future getData() async {
    var data = {
      // 'officeId': '1'
      'officeId':widget.uid
    };
    var response = await http.post(Uri.parse("${Con.url}viewAdoptRequest.php"),
        body: data);
    print(response.body);
    if(json.decode(response.body)[0]['result']=='failed'){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No request found...')));
    }
    else {
     // throw Exception('Failed to load data!');
      return json.decode(response.body);

    }
  }

  Future updateRequest() async {
    var data = {
      'requestId': requestId.toString(),
      'replyDate': DateTime.now().toString(),
      'reply': reply
    };
    var response = await http.post(Uri.parse("${Con.url}updateRequest.php"),
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
                              title: Text('Animal ID: #${list[index]['animalId'].toString()}'),
                              subtitle:
                                  Text('User ID: #${list[index]['userId'].toString()}'),
                            ),
                          ),
                          ButtonBar(
                            children: [
                              OutlinedButton(
                                  onPressed: () {
                                    reply = 'accepted';

                                    setState(() {
                                      updateRequest();
                                    });
                                  },
                                  child: Text('Accept')),
                              OutlinedButton(
                                  onPressed: () {
                                    reply = 'declined';

                                    setState(() {
                                      updateRequest();
                                    });
                                  },
                                  child: Text('Decline')),
                            ],
                          )
                        ],
                      );
                    })
                : Center(
                    child: Text('No Request Found'),
                  );
          },
        ),
      ),
    );
  }
}
