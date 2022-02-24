import 'package:flutter/material.dart';
import 'package:whatanime/animepage.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String url = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("What Anime?")),

        body: Center(
            child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Paste the image url here"),
                        onChanged: (value) {
                          url = value;
                        },
                      ),
                    ),

                    Padding(padding: EdgeInsets.only(right: 4)),
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                          return AnimePage(url: url);
                        }));
                      },
                    )
                  ],
                )
            )
        )

    );
  }
}