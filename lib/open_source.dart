import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OpenSourceScreen extends StatefulWidget {
  @override
  _OpenSourceScreenState createState() => _OpenSourceScreenState();
}

class _OpenSourceScreenState extends State<OpenSourceScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 48.0),
            child: Text(
              "Open Source Projects",
              style: GoogleFonts.comfortaa(
                fontSize: Theme.of(context).textTheme.display1.fontSize,
                fontWeight: Theme.of(context).textTheme.display1.fontWeight,
              ),
            ),
          ),
          Container(
            height: 250,
            margin: EdgeInsets.all(16),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                getCardItem("images/android_logo.png"),
                getCardItem("images/flutter_logo.png"),
                getCardItem("images/kotlin_logo.png"),
                getCardItem("images/dart_logo.png."),
                getCardItem("images/java_logo.png"),
                getCardItem("images/2dimension_logo.png"),
                getCardItem("images/firebase_logo.png"),
                getCardItem("images/ml_kit_logo.png"),
                getCardItem("images/unity_logo.png"),
                getCardItem("images/php_logo.png"),
                getCardItem("images/mysql_logo.png"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getCardItem(String imageAssetName) {
    return Container(
      width: 250,
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "Android Library",
                style: GoogleFonts.comfortaa(
                  fontSize: Theme.of(context).textTheme.caption.fontSize,
                  fontWeight: Theme.of(context).textTheme.caption.fontWeight,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "Coverflow",
                style: GoogleFonts.comfortaa(
                  textStyle: TextStyle(color: Colors.blue),
                  fontSize: Theme.of(context).textTheme.headline.fontSize,
                  fontWeight: Theme.of(context).textTheme.headline.fontWeight,
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                "It is an android library which is used to create beautiful snapping animation for your Viewpager2.",
                style: GoogleFonts.comfortaa(
                  fontSize: Theme.of(context).textTheme.body2.fontSize,
                  fontWeight: Theme.of(context).textTheme.body2.fontWeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
