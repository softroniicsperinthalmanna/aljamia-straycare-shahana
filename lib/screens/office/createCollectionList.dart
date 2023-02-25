import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import '../../../../connection/connect.dart';
import '../../../style/style.dart';

class CreateCollectionList extends StatefulWidget {
 const CreateCollectionList({Key? key}) : super(key: key);


  @override
  _CreateCollectionListState createState() => _CreateCollectionListState();
}

class _CreateCollectionListState extends State<CreateCollectionList> {


  @override
  void initState() {
    super.initState();
  }

  File? _image;
  final picker = ImagePicker();

  TextEditingController description = TextEditingController();
  TextEditingController collectedOn = TextEditingController();
  TextEditingController animalColor = TextEditingController();
  TextEditingController animalType = TextEditingController();
  TextEditingController breed = TextEditingController();
  var gender;

  Future choiceImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedImage!.path);
    });
  }

  Future upload(File imageFile) async {
    print(description.text);


    //var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    //var length = await imageFile.length();
    var uri = Uri.parse("${Con.url}collection.php");

    var request = http.MultipartRequest("POST", uri);
    // request.fields['bookName'] = name.text;
    request.fields['officeId'] = '3';
    request.fields['description'] = description.text;
    request.fields['gender'] = gender;
    request.fields['animalType'] = animalType.text;
    request.fields['animalColor'] = animalColor.text;
    request.fields['breed'] = breed.text;
    request.fields['collectedOn'] = collectedOn.text;


    var pic = await http.MultipartFile.fromPath("image", imageFile.path);
    //var pic = http.MultipartFile("image",stream,length,filename: basename(imageFile.path));

    request.files.add(pic);
    var response = await request.send();

    if (response.statusCode == 200) {
      print("image uploaded");
    } else {
      print("uploaded failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: vio,
          title: Text(
            'Create a Collection',
            style: subHead,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListView(
            children: <Widget>[
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  //     child: _image == null ? Text('No image selected') : Image.file(_image!),
                  child: _image == null
                      ? Stack(children: [
                    Center(
                      child: InkWell(
                        onTap: () {
                          upload(_image!);
                        },
                        child: Card(
                          elevation: 5,
                          child: Container(
                            //color: Colors.red,
                            height: 200,
                            width: 250,
                            child: Center(
                                child: Text(
                                  '-- Click to select image --',
                                  style: normalTextPlay,
                                )),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        right: 80,
                        top: 180,
                        child: ClipOval(
                            child: Container(
                              height: 50,
                              width: 50,
                              color: Colors.blueGrey[100],
                              child: IconButton(
                                icon: Icon(
                                  Icons.photo_camera_back_outlined,
                                  size: 30,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  choiceImage();
                                },
                              ),
                            )))
                  ])
                      : Image.file(_image!),
                ),
              ),


              SizedBox(
                height: 10,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                controller: description,
                keyboardType: TextInputType.text,
                maxLines: 5,
                decoration: InputDecoration(

                  prefixIcon: Icon(Icons.description_outlined),
                  enabledBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: vio)),
                  focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: vio)),

                  label: Text(
                    'Add Description',
                    style: normalTextPlay,
                  ),
                ),
              ),


              SizedBox(
                height: 10,
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                          title: Text('Male',
                            style: normalTextPlay,
                          ),
                          value: 'male',
                          groupValue: gender,
                          onChanged: (val){
                            setState(() {
                              gender=val;
                            });
                          }),
                    ),
                    Expanded(
                      child: RadioListTile(
                          title: Text('Female'

                            , style: normalTextPlay,
                          ),
                          value: 'female',
                          groupValue: gender,
                          onChanged: (val){
                            setState(() {
                              gender=val;
                            });
                          }),
                    ),
                  ],
                ),
              ),


              SizedBox(
                height: 10,
              ),


              TextFormField(

                controller: collectedOn,
                //editing controller of this TextField
                decoration: InputDecoration(
                  label: Text(
                    'Collected On',
                    style: normalTextPlay,
                  ),
                  enabledBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: vio)),
                  focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: vio)),

                  prefixIcon: Icon(Icons.calendar_today), //icon of text field
                ),
                //readOnly: true,
                //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now().subtract(Duration(days: 100)),
                      // firstDate: DateTime(1950),
                      //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2100));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    setState(() {
                      collectedOn.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {}
                },
              ),

              SizedBox(
                height: 10,
              ),



              TextFormField(
                controller: animalType,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.pets_outlined),
                  enabledBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: vio)),
                  focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: vio)),

                  label: Text(
                    'Animal',
                    style: normalTextPlay,
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: animalColor,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.color_lens_outlined),
                  enabledBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: vio)),
                  focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: vio)),

                  label: Text(
                    'Color',
                    style: normalTextPlay,
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: breed,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.type_specimen_outlined),
                  enabledBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: vio)),
                  focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: vio)),

                  label: Text(
                    'Breed',
                    style: normalTextPlay,
                  ),
                ),
              ),

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
                      onPressed: () {
                        if (_image != null) {
                          upload(_image!);
                          //  upload(_image!);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              'Adding ...',
                              style:
                              TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            backgroundColor: Color(0xfa8f7805),
                          ));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              'Added Successfully ...',
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            backgroundColor: Color(0xfa8f7805),
                          ));

                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text(
                              'All fields required ...',
                              style:
                              TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            backgroundColor: Color(0xfa8f7805),
                          ));

                          throw 'choose image';
                        }
                      },
                      child: Center(
                          child: ListTile(
                            title: Text(
                              'Add',
                              style: btnHeadPlay,
                            ),

                          ),
                      )),
                ),
              ),
              SizedBox(
                height: 10,
              ),


              // ElevatedButton(child: Text('Upload Image'),
              //   onPressed: (){
              //     upload(_image!);
              //   },),
            ],
          ),
        ),
      ),
    );
  }
}
