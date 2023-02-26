
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:straycare_app/auth/userRegister.dart';
import 'package:straycare_app/screens/User/userHome.dart';

import '../connection/connect.dart';
import '../models/model.dart';
import '../style/style.dart';
class UserLogin extends StatefulWidget {
   UserLogin({Key? key}) : super(key: key);

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  var phone = TextEditingController();
  var pswd = TextEditingController();
  var user;
  var flag=0;

  @override
  void initState(){
    super.initState();


  }

  Future<dynamic> userSignIn() async {
    var data = {
      "phone": phone.text,
      "password": pswd.text
    };
    var response = await post(Uri.parse('${Con.url}userLogin.php'), body: data);
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

           Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => UserHome(

                  //      logID: loginID.toString(),
                )));

        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Failed')));
          // Navigator.pushReplacement(context,
          //     MaterialPageRoute(builder: (context) => Login()));
        }
      }


      else {

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Failed')));
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
                  controller: phone,
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
                    hintText: "Phone",
                    hintStyle: TextStyle(color: Color(0xff9088E4)),


                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:10.0,left: 50,right: 50,bottom:15),
                child: TextFormField(
                  controller: pswd,
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
                  userSignIn();
                 // Navigator.push(context, MaterialPageRoute(builder: (context)=>UserHome()));
                },
                child: Container(
                    height: 65,
                    width: 300,
                    decoration: btnDecoration,
                    child:Center(child: Text('Submit',style:btnText),)
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));

                  },
                  child: RichText(
                    text: TextSpan(
                        text: 'Not Registered Yet?',
                        style: GoogleFonts.poppins(color: Colors.amber),
                        children: [
                          TextSpan(
                              text: ' Sign Up',
                              style: GoogleFonts.poppins(
                                  color: Colors.red, fontSize: 18))
                        ]),
                  ))

            ],
          ),
        ),),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(bottom: 250.0,right: 20,left: 1),
      //   child: FloatingActionButton(
      //     backgroundColor:Color(0xff9088E4) ,
      //     foregroundColor: Colors.white,
      //     onPressed: (){
      //
      //     },
      //     child: Icon(Icons.arrow_back_ios_new,size: 30,),
      //   ),
      // ),

    )    ;
  }
}



