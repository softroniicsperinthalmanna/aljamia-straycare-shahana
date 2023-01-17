import 'package:flutter/material.dart';
import 'package:veterinary/screens/office/officelogin.dart';

import 'adoptedlist.dart';
import 'collectedlist.dart';
import 'deadlist.dart';
import 'fosteringlist.dart';
class ViewList extends StatelessWidget {
  const ViewList({Key? key}) : super(key: key);

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
              onTap: (){                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Collectedlist()));
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
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Fosteringlist()));

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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Adoptedlist()));

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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Deadlist()));

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
        onPressed: (){                Navigator.push(context, MaterialPageRoute(builder: (context)=>officelogin()));
        },
        child: Icon(Icons.arrow_back_ios_new,size: 30,),
      ),

    );
  }
}
