import 'package:flutter/material.dart';

class ImageLoader extends StatefulWidget {
  String imageUrl, animeName, similarity;
  ImageLoader({this.imageUrl, this.animeName, this.similarity});

  @override
  ImageLoaderState createState() => ImageLoaderState(imageUrl: imageUrl, animeName: animeName, similarity: similarity);
}

class ImageLoaderState extends State<ImageLoader> {
  String imageUrl, animeName, similarity;

  ImageLoaderState({this.imageUrl, this.animeName, this.similarity});

  @override
  Widget build(BuildContext context) {
    if(animeName == null)
      animeName = "no name specified";

    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

        child: InkWell(
            onTap: (){
              print("tapped");
            },

            child: Padding(
                padding: EdgeInsets.all(12),

                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.network(imageUrl),
                      Padding(padding: EdgeInsets.only(top: 8)),
                      Text(animeName),
                      Padding(padding: EdgeInsets.only(top: 8)),
                      Text(similarity, style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.start)
                    ]
                )
            )
        )
    );
  }
}