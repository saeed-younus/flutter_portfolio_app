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
            padding: const EdgeInsets.only(top: 32.0),
            child: Text(
              "Skills",
              style: TextStyle(
                fontFamily: "Comfortaa",
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
                      getCardItem("images/android_logo.png", "Android"),
                      getCardItem("images/flutter_icon.png", "Flutter"),
                      getCardItem("images/kotlin_logo.png", " Kotlin"),
                      getCardItem("images/dart_logo.png.", "Dart"),
                      getCardItem("images/java_logo.png", "Java"),
                      getCardItem("images/flare_logo.png", "Flare"),
                      getCardItem("images/firebase_logo.png", "Firebase"),
                      getCardItem("images/ml_kit_logo.png", "ML Kit"),
                      getCardItem("images/dialogflow_logo.png", "Dialogflow"),
                      getCardItem("images/unity_logo.png", "Unity"),
                      getCardItem("images/3ds_max_logo.png", "3ds Max"),
                      getCardItem("images/php_logo.png", "php"),
                      getCardItem("images/mysql_logo.png", "MySql"),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: 150,
              height: 75,
              child: Image.asset(imageAssetName),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              text,
              style: TextStyle(
                fontFamily: "OpenSans",
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
