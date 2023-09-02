import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}
