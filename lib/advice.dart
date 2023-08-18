// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Advice extends StatelessWidget {
    
    final String topic;
    final String text;
  const Advice({super.key, required this.topic,required this.text });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text(
                topic
                ,style: GoogleFonts.roboto(
                color: Colors.white,fontWeight: FontWeight.w700,fontSize: 20
              ),
              textAlign: TextAlign.center,
              
              ),
              SizedBox(height: 10,),
          Text(text,
               style: TextStyle(color: Colors.white,fontSize: 15),
               
                textAlign: TextAlign.center,)  
            ]),
          ),
      ),
    );
  }
}