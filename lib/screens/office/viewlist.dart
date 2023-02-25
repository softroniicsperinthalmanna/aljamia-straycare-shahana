import 'package:flutter/material.dart';
import 'package:straycare_app/screens/office/deadlist.dart';
import 'package:straycare_app/auth/login.dart';

import 'adoptRequest.dart';
import 'adoptedlist.dart';
import 'collectedlist.dart';
import 'fosteringlist.dart';
class ViewList extends StatelessWidget {
   ViewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        height: double.infinity,
        width: double.infinity,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){

                Navigator.push(context, MaterialPageRoute(builder: (context)=>Collectedlist()));
              },
              child: Container(
                  height: 70,
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Color(0xff9088E4)
                  ),
                  child:Center(child: Text('View Collected Animals',style: TextStyle(color:Colors.white,fontSize: 25),))
              ),
            ),
             SizedBox(height: 70,),
            InkWell(
              onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>FosteringList()));

              },
              child: Container(
                  height: 70,
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Color(0xff9088E4)
                  ),
                  child:Center(child: Text('View Animals under Fostering',style: TextStyle(color: Colors.white,fontSize: 23
                  ),))
              ),
            ),
            SizedBox(height: 70,),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ToAdoptRequests()));

              },
              child: Container(
                  height: 70,
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Color(0xff9088E4)
                  ),
                  child:Center(child: Text('View Adopted Animals',style: TextStyle(color: Colors.white,fontSize: 25),)
                  )
              ),
            ),
            SizedBox(height: 70,),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DeadList()));

              },
              child: Container(
                  height: 70,
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Color(0xff9088E4)
                  ),
                  child:Center(child: Text('View Dead Animals',style: TextStyle(color: Colors.white,fontSize: 25),))
              ),
            )

          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:Color(0xff9088E4) ,
        foregroundColor: Colors.white,
        onPressed: (){
        //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Login(
        //   type: type,
        // )));
        },
        child: Icon(Icons.arrow_back_ios_new,size: 30,),
      ),

    );
  }
}
