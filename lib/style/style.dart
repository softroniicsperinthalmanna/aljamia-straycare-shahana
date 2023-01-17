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
var normalText=GoogleFonts.poppins(color:Color(0xff9088E4) ,fontSize: 16);
