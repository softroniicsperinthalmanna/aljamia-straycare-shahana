import 'package:flutter/material.dart';
import 'package:straycare_app/models/model.dart';
import 'package:straycare_app/screens/office/viewlist.dart';

import 'Deadindividual.dart';
class Deadlist extends StatefulWidget {
  const Deadlist({Key? key}) : super(key: key);

  @override
  State<Deadlist> createState() => _DeadlistState();
}

class _DeadlistState extends State<Deadlist> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(

            children: [
              Padding(
                padding: const EdgeInsets.only(left:20,top:42.0,right: 20,bottom: 20),
                child: TextFormField(
                  decoration:InputDecoration(
                    hintText: "                             Search",
                    hintStyle: TextStyle(color: Color(0xff9088E4)),
                    prefixIcon: Icon(Icons.search),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xff9088E4)
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xff9088E4)
                        )

                    ),

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text
                  ("Dead Animals",style:TextStyle(color: Color(0xff9088E4),fontSize: 35),),
              ),
              Container(
                height: 700,

                child: GridView.builder(
                    itemCount: police.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 5
                    ),


                    itemBuilder: (context,index){
                      return InkWell(onTap: (){            Navigator.push(context, MaterialPageRoute(builder: (context)=>deadcasecard()));
                      },
                        child: Expanded(
                          child: Container(
                            height: 350,
                            width: 350,
                            child: Image(image: AssetImage("assets/images/"+police[index]['img']),fit: BoxFit.cover,),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:Color(0xff9088E4) ,
        foregroundColor: Colors.white,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewList()));

        },
        child: Icon(Icons.arrow_back_ios_new,size: 30,),
      ),

    );
  }
}
