import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillScreen extends StatefulWidget {
  @override
  _SkillScreenState createState() => _SkillScreenState();
}

class _SkillScreenState extends State<SkillScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 48.0),
            child: Text(
              "Skills",
              style: GoogleFonts.comfortaa(
                fontSize: Theme.of(context).textTheme.display2.fontSize,
                fontWeight: Theme.of(context).textTheme.display2.fontWeight,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: ListView(
                children: <Widget>[
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: <Widget>[
                      getCardItem("images/android_logo.png", "android"),
                      getCardItem("images/flutter_icon.png", "Flutter"),
                      getCardItem("images/kotlin_logo.png", " Kotlin"),
                      getCardItem("images/dart_logo.png.", "Dart"),
                      getCardItem("images/java_logo.png", "Java"),
                      getCardItem("images/flare_logo.png", "Flare"),
                      getCardItem("images/firebase_logo.png", "Firebase"),
                      getCardItem("images/ml_kit_logo.png", "ML Kit"),
                      getCardItem("images/dialogflow_logo.png", "Dialogflow"),
                      getCardItem("images/unity_logo.png", "unity"),
                      getCardItem("images/3ds_max_logo.png", "3ds Max"),
                      getCardItem("images/php_logo.png", "php"),
                      getCardItem("images/mysql_logo.png", "mysql"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getCardItem(String imageAssetName, String text) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Container(
              width: 200,
              height: 100,
              child: Image.asset(imageAssetName),
            ),
            Text(
              text,
              style: GoogleFonts.comfortaa(
                fontSize: Theme.of(context).textTheme.headline.fontSize,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
