// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/home_page.dart';
import 'package:project/introduce.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future <void> main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? username = prefs.getString('username');
  
  runApp( 
    MaterialApp(debugShowCheckedModeBanner: false,home: username == null ? IntroduceScreen() : HomePage())
  );
}

