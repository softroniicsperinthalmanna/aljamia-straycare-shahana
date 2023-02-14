import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var bubble= BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/images/AppHome.png",),fit: BoxFit.cover
    )
);
var btnDecoration=BoxDecoration(
    borderRadius: BorderRadius.circular(60),
    color: Color(0xff9088E4)
);
var btnText=GoogleFonts.poppins(color: Colors.white ,fontSize: 20);
var boardText=GoogleFonts.poppins(color:  Color(0xff9088E4) ,fontSize: 20,fontWeight: FontWeight.bold);
var normalText=GoogleFonts.poppins(color:Color(0xff9088E4) ,fontSize: 16);
var mainHead= GoogleFonts.playball(fontSize: 72,color:Color(0xff9088E4) );
var subHead= GoogleFonts.playball(fontSize: 35,color:Color(0xff9088E4) );
var btnHeadPlay= GoogleFonts.playball(fontSize: 23,color:Colors.white );
var vioBtnHeadPlay= GoogleFonts.playball(fontSize: 23,color:Color(0xff9088E4) );
var normalTextPlay= GoogleFonts.playball(fontSize: 16,color:Color(0xff9088E4) );
var blackTextPlay= GoogleFonts.playball(fontSize: 16,color: Colors.black );
var whiteTextPlay= GoogleFonts.playball(fontSize: 25,color:Colors.white,letterSpacing: 5);
var vio= Color(0xff9088E4);
