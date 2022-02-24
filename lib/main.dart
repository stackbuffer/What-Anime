import 'package:flutter/material.dart';
import 'package:whatanime/animepage.dart';
import 'homepage.dart';
import 'animepage.dart';

void main(){
  runApp(
      new MaterialApp(
        debugShowCheckedModeBanner: false,

        home: HomePage(),

        routes: <String, WidgetBuilder>{
          '/AnimePage': (BuildContext context) => AnimePage()
        },
      )
  );
}