
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:straycare_app/screens/forest/forestcasecard.dart';

import 'package:straycare_app/screens/office/viewlist.dart';
import 'package:straycare_app/screens/police/policecasecard.dart';

import '../connection/connect.dart';
import '../models/model.dart';
import '../screens/localgovernment/lsgcasecard.dart';
import '../screens/vecterinary/vecterinarycasecard.dart';
import '../style/style.dart';
class Login extends StatefulWidget {
   Login({Key? key,required this.type}) : super(key: key);
var type;
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var code = TextEditingController();
  var pswd = TextEditingController();
  var flag=0;
  var authority;
  @override
  void initState(){
    super.initState();
    authority=widget.type;

  }
  Future<dynamic> signIn() async {
    var data = {
      "code": code.text,
      "password": pswd.text,
      "type":widget.type
    };
    var response = await post(Uri.parse('${Con.url}login.php'), body: data);
    print(response.body);
    print(response.statusCode);
    var loginID;
    loginID=jsonDecode(response.body)['login_id'];
    print(loginID);
    if(response.statusCode==200){
      if(jsonDecode(response.body)['message']=='User Successfully Logged In') {
        flag = 1;
        print('flag value:$flag');
        print(loginID);

        if (flag == 1) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Logging In ...')));
          print(loginID);
          // Navigator.pushReplacement(context,
          //     MaterialPageRoute(builder: (context) => SellerHome(
          //
          //       logId: loginID.toString(),
          //     )));
          switch(authority){

                case 'office':  Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => ViewList(
                  uid:loginID ,

            //      logID: loginID.toString(),
                )));break;
            case 'lsg':  Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => lsgCaseCard(

               //   logID: loginID.toString(),
                )));break;
                case 'forest':  Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => forestCaseCard(

               //   logID: loginID.toString(),
                )));break;
                case 'vet':  Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => VetCaseCard(

               //   logID: loginID.toString(),
                )));break;
                case 'police':  Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => policeCaseCard(

               //   logID: loginID.toString(),
                )));break;


          }

        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(' Login Failed')));
          // Navigator.pushReplacement(context,
          //     MaterialPageRoute(builder: (context) => Login()));
        }
      }


      else {

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid Credential ! Login Failed !')));
        // Navigator.pushReplacement(context,
        //     MaterialPageRoute(builder: (context) => Login(
        //
        //     )));
      }
      return jsonDecode(response.body);



    }
    else{
      return Center(child: CircularProgressIndicator());
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height:double.infinity,
        width: double.infinity,
        decoration:bubble,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Text("Stray Care",style:GoogleFonts.playball(fontSize: 72,color:Color(0xff9088E4) ),),
              ),
              Container(
                height: 400,width: 500,
                child: Image(
                  image: AssetImage("assets/images/"+logo),fit: BoxFit.cover,),
              ),
              Padding(
                padding: const EdgeInsets.only(top:1.0,left: 50,right: 50,bottom: 1),
                child: TextFormField(
                  controller: code,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      //  borderSide: BorderSide(color: Color(0xff9088E4)),
                      borderSide: BorderSide(
                        color:  Color(0xff9088E4),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //  borderSide: BorderSide(color: Color(0xff9088E4)),
                      borderSide: BorderSide(
                        color:  Color(0xff9088E4),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    hintText: "code",
                    hintStyle: TextStyle(color: Color(0xff9088E4)),


                  ),
                  textAlign: TextAlign.center,

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:10.0,left: 50,right: 50,bottom:15),
                child: TextFormField(
                  controller: pswd,
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      //  borderSide: BorderSide(color: Color(0xff9088E4)),
                      borderSide: BorderSide(
                        color:  Color(0xff9088E4),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //  borderSide: BorderSide(color: Color(0xff9088E4)),
                      borderSide: BorderSide(
                        color: Color(0xff9088E4),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Color(0xff9088E4)),

                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              InkWell(
                onTap: (){
                  if(code.text.isNotEmpty && pswd.text.isNotEmpty) {
                    signIn();
                  }else
                    {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('All fields required...')));

                    }
                 // Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewList()));

                },
                child: Container(
                    height: 65,
                    width: 300,
                    decoration: btnDecoration,
                    child:Center(child: Text('Submit',style:btnText),)
                ),
                //  floatingActionButton: FloatingActionButton(
                //   backgroundColor:Color(0xff9088E4) ,
                //   foregroundColor: Colors.white,
                //   onPressed: (){},
                //   child: Icon(Icons.arrow_back_ios_new,size: 30,),
                // ),

              )
            ],
          ),
        ),),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 250.0,right: 20,left: 1),
        child: FloatingActionButton(
          backgroundColor:Color(0xff9088E4) ,
          foregroundColor: Colors.white,
          onPressed: (){},
          child: Icon(Icons.arrow_back_ios_new,size: 30,),
        ),
      ),

    )    ;
  }
}



