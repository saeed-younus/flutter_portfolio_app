import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen>
    with SingleTickerProviderStateMixin {
  double _opacity = 0;
  Alignment _alignment = Alignment(0, 0.2);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _opacity = 1;
        _alignment = Alignment(0, 0);
      });
    });
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                "images/about_1.jpg",
                fit: BoxFit.cover,
                alignment: Alignment(-1, 0.5),
              ),
            ),
          ),
          SizedBox(width: 32),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(32),
              child: Stack(
                children: <Widget>[
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 400),
                    opacity: _opacity,
                    child: AnimatedAlign(
                      duration: Duration(milliseconds: 400),
                      alignment: _alignment,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Who Me!\n",
                            style: GoogleFonts.comfortaa(
                              fontSize:
                                  Theme.of(context).textTheme.display3.fontSize,
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .display1
                                  .fontWeight,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: "I am ",
                              children: [
                                TextSpan(
                                  text:
                                      "Android, PHP, Unity and Flutter developer. ",
                                  style: GoogleFonts.comfortaa(
                                    textStyle: TextStyle(color: Colors.white),
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      "I am tech-enthsuast and always keen for sharing my knowledge to others. ",
                                ),
                                TextSpan(
                                  text:
                                      "Programming is my passion. Love android, flutter and creative designs.",
                                ),
                                TextSpan(
                                  text:
                                      "\n\nI am always looking for my weakness and thankful to those who teach, support and pray for me.",
                                  style: GoogleFonts.comfortaa(
                                    textStyle: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                              style: GoogleFonts.comfortaa(
                                textStyle: TextStyle(color: Colors.white54),
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .headline
                                    .fontSize,
                                fontWeight: Theme.of(context)
                                    .textTheme
                                    .body2
                                    .fontWeight,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
