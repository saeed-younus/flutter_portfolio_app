import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillScreen extends StatefulWidget {
  @override
  _SkillScreenState createState() => _SkillScreenState();
}

class _SkillScreenState extends State<SkillScreen> {
  bool isDesktop = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var size = MediaQuery.of(context).size;
    if (size.width > size.height) {
      isDesktop = true;
    } else {
      isDesktop = false;
    }
  }

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
                fontSize: isDesktop
                    ? Theme.of(context).textTheme.display2.fontSize
                    : Theme.of(context).textTheme.display1.fontSize,
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
                      SkillItem("images/android_logo.png", "Android"),
                      SkillItem("images/flutter_icon.png", "Flutter"),
                      SkillItem("images/kotlin_logo.png", " Kotlin"),
                      SkillItem("images/dart_logo.png.", "Dart"),
                      SkillItem("images/java_logo.png", "Java"),
                      SkillItem("images/flare_logo.png", "Flare"),
                      SkillItem("images/firebase_logo.png", "Firebase"),
                      SkillItem("images/ml_kit_logo.png", "ML Kit"),
                      SkillItem("images/dialogflow_logo.png", "Dialogflow"),
                      SkillItem("images/unity_logo.png", "Unity"),
                      SkillItem("images/3ds_max_logo.png", "3ds Max"),
                      SkillItem("images/php_logo.png", "php"),
                      SkillItem("images/mysql_logo.png", "MySql"),
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
}

class SkillItem extends StatelessWidget {
  final String _imageAssetName;
  final String _text;

  SkillItem(
    this._imageAssetName,
    this._text,
  ) : super();

  @override
  Widget build(BuildContext context) {
    bool isDesktop = true;
    var size = MediaQuery.of(context).size;
    if (size.width > size.height) {
      isDesktop = true;
    } else {
      isDesktop = false;
    }
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: isDesktop ? 150 : 100,
              height: isDesktop ? 75 : 50,
              child: Image.asset(_imageAssetName),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              _text,
              style: const TextStyle(
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
