import 'package:flutter/material.dart';
import 'package:veterinary/screens/office/viewlist.dart';
class Fosteringcasecard extends StatelessWidget {
  const Fosteringcasecard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(


        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: Container(
                    height: 250,
                    width: 300,
                    child: Image(image: AssetImage("assets/images/abuseani.jpg"),fit: BoxFit.cover,)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                height: 180,
                width:300 ,
                child:Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("Description"),
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff9088E4))
                ),    ),
            ),
            InkWell(
              onTap: (){},
              child: Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: Container(
                    height: 65,
                    width: 290,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: Color(0x9dc4554d)
                    ),
                    child:Center(child: Text('Dead',style: TextStyle(color: Colors.white,fontSize: 30,fontFamily: "poppins "),))
                ),
              ),
            ),
            InkWell(
              onTap: (){},
              child: Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: Container(
                    height: 65,
                    width: 290,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: Color(0xfc8cd58d)
                    ),
                    child:Center(child: Text('Adopted',style: TextStyle(color: Colors.white,fontSize: 30,fontFamily: "poppins "),))
                ),
              ),
            ),



          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:Color(0xff9088E4) ,
        foregroundColor: Colors.white,
        onPressed: (){

        },
        child: Icon(Icons.arrow_back_ios_new,size: 30,),
      ),
    );

  }
}