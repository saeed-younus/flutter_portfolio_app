import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'demo/Instagram.dart';
import 'demo/WhatsApp.dart';

class DemoScreen extends StatefulWidget {
  @override
  _DemoScreenState createState() => _DemoScreenState();
}

enum DemoEnum { whatsapp, instagram }

class _DemoScreenState extends State<DemoScreen> {
  DemoEnum _demoType = DemoEnum.whatsapp;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: "Live Demo\n",
                      children: [
                        TextSpan(
                          text: "Which is created in ",
                          style: GoogleFonts.comfortaa(
                            textStyle: TextStyle(color: Colors.white60),
                            fontSize:
                                Theme.of(context).textTheme.display2.fontSize,
                            fontWeight:
                                Theme.of(context).textTheme.display2.fontWeight,
                          ),
                        ),
                        TextSpan(
                          text: "Flutter\n",
                        ),
                      ],
                      style: GoogleFonts.comfortaa(
                        textStyle: TextStyle(color: Colors.white),
                        fontSize: Theme.of(context).textTheme.display3.fontSize,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset("images/flutter_icon.png"),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(16),
                    child: Card(
                      child: MaterialApp(
                        debugShowCheckedModeBanner: false,
                        theme: ThemeData.light(),
                        home: getDemo(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "You can run the demo by using common gestures. And change demo by clicking below buttons.",
                    style: GoogleFonts.comfortaa(
                      textStyle: TextStyle(color: Colors.white60),
                      fontSize: Theme.of(context).textTheme.headline.fontSize,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      _demoType = DemoEnum.whatsapp;
                    });
                  },
                  padding: EdgeInsets.all(8),
                  color: Colors.black54,
                  child: Text(
                    "Whatsapp",
                    style: GoogleFonts.comfortaa(
                      textStyle: TextStyle(
                          color: _demoType == DemoEnum.whatsapp
                              ? Colors.lightGreenAccent
                              : Colors.white70),
                      fontSize: Theme.of(context).textTheme.headline.fontSize,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      _demoType = DemoEnum.instagram;
                    });
                  },
                  padding: EdgeInsets.all(8),
                  color: Colors.black54,
                  child: Text(
                    "Instagram",
                    style: GoogleFonts.comfortaa(
                      textStyle: TextStyle(
                          color: _demoType == DemoEnum.instagram
                              ? Colors.pinkAccent
                              : Colors.white70),
                      fontSize: Theme.of(context).textTheme.headline.fontSize,
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

  Widget getDemo() {
    switch (_demoType) {
      case DemoEnum.whatsapp:
        return WhatsApp();
        break;
      case DemoEnum.instagram:
        return Instagram();
        break;
    }
  }
}
