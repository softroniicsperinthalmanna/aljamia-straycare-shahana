import 'package:flutter/material.dart';
import 'package:straycare_app/screens/office/adoptAccepted.dart';
import 'package:straycare_app/screens/office/adoptRequest.dart';
import 'package:straycare_app/screens/office/adoptedlist.dart';

class Adopt extends StatefulWidget {
   Adopt({Key? key,required this.uid}) : super(key: key);
  var uid;
  @override
  State<Adopt> createState() => _AdoptState();
}

class _AdoptState extends State<Adopt> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Adopted'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(child: Text('Home')),
              Tab(child: Text('Requests')),
              Tab(child: Text('Accepted')),
            ],
          ),
        ),
        body:  TabBarView(
          children: [
            AdoptedList(uid: widget.uid,),
            ToAdoptRequests(uid: widget.uid,),
            AdoptAccepted(uid: widget.uid,),
          ],
        ),
      ),
    ));
  }
}
