import 'package:flutter/material.dart';
class adoptedcasecard extends StatelessWidget {
  const adoptedcasecard({Key? key}) : super(key: key);

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
                    child: Image(image: AssetImage("assets/images/cat.jpg"),fit: BoxFit.cover,)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                height: 280,
                width:300 ,
                child:Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("Description"),
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff9088E4))
                ),    ),
            ),



          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:Color(0xff9088E4) ,
        foregroundColor: Colors.white,
        onPressed: (){},
        child: Icon(Icons.arrow_back_ios_new,size: 30,),
      ),
    );

  }
}
