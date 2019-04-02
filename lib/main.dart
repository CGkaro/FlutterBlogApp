import 'package:flutter/material.dart';
import 'package:flutter_app/LoginRegisterPage.dart';
import 'package:flutter_app/Homepage.dart';
import 'package:flutter_app/Mapping.dart';
import 'package:flutter_app/Authentication.dart';

const heightRadius=100.0;
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      theme: new ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MappingPage(auth: Auth(), ),
    ),
  );
}


