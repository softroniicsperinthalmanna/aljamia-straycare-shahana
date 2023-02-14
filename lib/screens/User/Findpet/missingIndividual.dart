import 'package:flutter/material.dart';
import 'package:straycare_app/screens/office/viewlist.dart';

import '../../../connection/connect.dart';
import '../../../style/style.dart';

class MissingDetailPage extends StatefulWidget {
  var name;
  var animal;
  var desc;
  var gender;
  var loc;
  var breed;
  var color;
  var miss_date;
  var report_date;
  var image;

   MissingDetailPage({Key? key,required this.name,required this.image,required this.animal,required this.desc,required this.gender,required this.loc,required this.breed,required this.color,required this.miss_date,required this.report_date}) : super(key: key);

  @override
  State<MissingDetailPage> createState() => _MissingDetailPageState();
}

class _MissingDetailPageState extends State<MissingDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(


          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children:[
                Center(
                  child: Card(
                    elevation: 5,
                    child: Container(
                        height: 250,
                        width: 370,
                        child: Image(image: NetworkImage('${Con.url}missingCase/${widget.image}'),fit: BoxFit.cover,)),
                  ),
                ),
                Container(
                  height: 410,
                  width:380 ,
                  decoration: BoxDecoration(
                   //   border: Border.all(color: Color(0xff9088E4))
                  ),
                  child:Card(
                    elevation: 50,
                    child: DataTable (
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                     // clipBehavior:Clip.none,
                      columnSpacing:3,
                     dataRowHeight:43,

                    //  border: TableBorder.all(color: vio,),
                      columns: [
                        DataColumn(label: Text('Name')),
                        DataColumn(label: Text(widget.name)),


                      ],
                      rows: [

                        DataRow(cells: [
                          DataCell(Text('Description ')),
                          DataCell(Text(': ${widget.desc}')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Gender ')),
                          DataCell(Text(': ${widget.gender}')),
                        ]),

                        DataRow(cells: [
                          DataCell(Text('Category ')),
                          DataCell(Text(': ${widget.animal}')),
                        ]),

                        DataRow(cells: [
                          DataCell(Text('Color ')),
                          DataCell(Text(': ${widget.color}')),
                        ]),

                        DataRow(cells: [
                          DataCell(Text('Breed ')),
                          DataCell(Text(': ${widget.breed}')),
                        ]),

                        DataRow(cells: [
                          DataCell(Text('Last Seen At ')),
                          DataCell(Text(': ${widget.loc}')),
                        ]),

                        DataRow(cells: [
                          DataCell(Text('Last Seen On ')),
                          DataCell(Text(': ${widget.miss_date}')),
                        ]),

                        DataRow(cells: [
                          DataCell(Text('Reported On ')),
                          DataCell(Text(': ${widget.report_date}')),
                        ]),




                      ],



                    ),
                  ),    ),



                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Container(
                    width: 200,
                    height: 55,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: vio,),
                        // side: BorderSide(color: vio)),
                        onPressed: (){
                          
                        },
                        child: Center(
                            child: ListTile(
                              title: Text(
                                'Found ?',
                                style: btnHeadPlay,
                              ),
                              trailing: CircleAvatar(
                                  backgroundColor: Colors.white54,
                                  child: Icon(Icons.send)),
                            ))),
                  ),
                ),

      SizedBox(
      height: 10,
      ),
      Align(
      alignment: Alignment.bottomRight,
      child: Container(
      width: 260,
      height: 60,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(60),
      color: vio
      ),
      child: ListTile(
      onTap: (){

      },
      title: Text(
      'Call Reporter',
      style: btnHeadPlay,
      ),
      leading: CircleAvatar(
      backgroundColor: Colors.white54,
      child: Icon(Icons.phone,color: Colors.red,)),
      ),
      ),
      ),

      const SizedBox(
      height: 24,
      ),





      ],
            ),
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor:Color(0xff9088E4) ,
        //   foregroundColor: Colors.white,
        //   onPressed: (){
        //     Navigator.pop(context);
        //
        //   },
        //   child: Icon(Icons.arrow_back_ios_new,size: 30,),
        // ),
      ),
    );

  }
}
