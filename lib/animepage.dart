import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'imageloader.dart';


class AnimePage extends StatefulWidget {

  final String url;
  AnimePage({this.url});

  @override
  AnimePageState createState() => AnimePageState(apiUrl: "https://api.trace.moe/search?url=${url}");
}

class AnimePageState extends State<AnimePage> {
  String apiUrl;
  AnimePageState({this.apiUrl});

  Future<String> getData() async {
    var response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          "Accept" : "application/json;charset=UTF-8",
          'Charset' : 'utf-8'
        }
    );

    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("What Anime?")),

        body: Container(
            child: FutureBuilder(
              future: getData(),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if(snapshot.data == null){
                  return CircularLoader();
                }
                else{
                  var data = jsonDecode(snapshot.data);
                  return ListView.builder(
                    itemCount: (data["result"]).length,
                    itemBuilder: (BuildContext context, int index){
                      return Container(
                        padding: EdgeInsets.all(4),
                        child: ImageLoader(
                            imageUrl: data["result"][index]["image"],
                            animeName: data["result"][index]["filename"],
                            similarity: "Similarity: " + ((data["result"][index]["similarity"])*100).toString()
                        ),
                      );
                    },
                  );
                }
              },
            )
        )
    );
  }
}

//circular loader
class CircularLoader extends StatefulWidget {
  @override
  CircularLoaderState createState() => CircularLoaderState();
}

class CircularLoaderState extends State<CircularLoader> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Making a http request to trace.moe"),
                  Padding(padding: EdgeInsets.only(right: 8)),
                  CircularProgressIndicator()
                ]
            )
        )
    );
  }
}