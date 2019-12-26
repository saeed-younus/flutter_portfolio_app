import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  Alignment _alignment = Alignment(0, 0.4);
  double _opacity = 0;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _alignment = Alignment(0, 0.3);
        _opacity = 1;
      });
    });
    return Container(
      child: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Opacity(
                  opacity: 0.75,
                  child: Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: Image.asset(
                      "images/about_2.jpg",
                      fit: BoxFit.cover,
                      alignment: Alignment(0, -0.25),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).canvasColor,
                        Colors.transparent,
                      ],
                      begin: Alignment(0, 1),
                      end: Alignment(0, 0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity: _opacity,
            child: AnimatedAlign(
              duration: Duration(milliseconds: 500),
              alignment: _alignment,
              child: RichText(
                text: TextSpan(
                  text: "Hey!! This is ",
                  children: [
                    TextSpan(
                      text: "Muhammad Saeed",
                      style: GoogleFonts.comfortaa(
                        textStyle: TextStyle(color: Colors.white),
                        fontSize: Theme.of(context).textTheme.display1.fontSize,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(color: Colors.white60),
                    fontSize: Theme.of(context).textTheme.display1.fontSize,
                    fontWeight: Theme.of(context).textTheme.display1.fontWeight,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
