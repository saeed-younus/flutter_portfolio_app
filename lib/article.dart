import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:js' as js;

class ArticleScreen extends StatefulWidget {
  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

enum DemoEnum { whatsapp, instagram }

class _ArticleScreenState extends State<ArticleScreen> {
  DemoEnum _demoType = DemoEnum.whatsapp;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      SizedBox(
                        width: 500,
                      ),
                      getCardItem(
                        "images/android_logo.png",
                        "ViewModel with ViewModelProvider.Factory : The Creator of ViewModel",
                        "Why and when we use ViewModelProvider.Factory for ViewModel.",
                        Colors.greenAccent,
                        () {
                          js.context.callMethod("open", [
                            "https://medium.com/koderlabs/viewmodel-with-viewmodelprovider-factory-the-creator-of-viewmodel-8fabfec1aa4f"
                          ]);
                        },
                      ),
                      getCardItem(
                        "images/android_logo.png",
                        "Motion Layout: Card Shuffle Animation",
                        "Hi friends! In this article we will explore motion layout to get it’s excellence and create card shuffle animation as shown in video.",
                        Colors.greenAccent,
                        () {
                          js.context.callMethod("open", [
                            "https://medium.com/@sendtosaeed2/motion-layout-card-shuffle-animation-810e7978e8d0"
                          ]);
                        },
                      ),
                      getCardItem(
                        "images/flutter_icon.png",
                        "Flutter: Material + Cupertino make together ❤",
                        "Run material widgets on Cupertino app or run cupertino widgets on Material App.",
                        Colors.lightBlueAccent,
                        () {
                          js.context.callMethod("open", [
                            "https://medium.com/@sendtosaeed2/flutter-material-cupertino-make-together-a3d2d7849548"
                          ]);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: IgnorePointer(
                  ignoring: true,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).canvasColor,
                          Colors.transparent,
                        ],
                        begin: Alignment(-0.95, 0),
                        end: Alignment(-0.25, 0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: "Published \nArticles",
                    style: GoogleFonts.comfortaa(
                      textStyle: TextStyle(color: Colors.white),
                      fontSize: Theme.of(context).textTheme.display3.fontSize,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getCardItem(String image, String title, String description,
      Color titleColor, VoidCallback onTap) {
    return Container(
      margin: EdgeInsets.all(16),
      width: 400,
      height: 300,
      child: Card(
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset(
                    image,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  title,
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(color: titleColor),
                    fontSize: Theme.of(context).textTheme.headline.fontSize,
                    fontWeight: Theme.of(context).textTheme.headline.fontWeight,
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Text(
                  description,
                  style: GoogleFonts.comfortaa(
                    fontSize: Theme.of(context).textTheme.headline.fontSize,
                    fontWeight: Theme.of(context).textTheme.headline.fontWeight,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
