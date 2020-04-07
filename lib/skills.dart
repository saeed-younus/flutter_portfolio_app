import 'dart:ui';

import 'package:flutter/material.dart';

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
          SizedBox(
            height: isDesktop ? 60 : 0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Text(
              "Skills",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: isDesktop
                    ? Theme.of(context).textTheme.display2.fontSize
                    : Theme.of(context).textTheme.display1.fontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: isDesktop ? 32.0 : 8,
                right: 16,
                left: 16,
              ),
              child: Column(
                children: <Widget>[
                  Wrap(
                    alignment: WrapAlignment.center,
                    runSpacing: 4,
                    spacing: 4,
                    children: <Widget>[
                      SkillItem(
                        "images/android_logo.png",
                        "Android",
                        Color.fromRGBO(200, 255, 200, 1),
                        500,
                      ),
                      SkillItem(
                        "images/flutter_icon.png",
                        "Flutter",
                        Color.fromRGBO(200, 235, 255, 1),
                        550,
                      ),
                      SkillItem(
                        "images/kotlin_logo.png",
                        "Kotlin",
                        Color.fromRGBO(255, 230, 200, 1),
                        600,
                      ),
                      SkillItem(
                        "images/dart_logo.png.",
                        "Dart",
                        Color.fromRGBO(200, 235, 255, 1),
                        650,
                      ),
                      SkillItem(
                        "images/java_logo.png",
                        "Java",
                        Color.fromRGBO(255, 220, 220, 1),
                        700,
                      ),
                      SkillItem(
                        "images/flare_logo.png",
                        "Flare",
                        Color.fromRGBO(250, 220, 250, 1),
                        750,
                      ),
                      SkillItem(
                        "images/firebase_logo.png",
                        "Firebase",
                        Color.fromRGBO(255, 255, 200, 1),
                        800,
                      ),
                      SkillItem(
                        "images/ml_kit_logo.png",
                        "ML Kit",
                        Color.fromRGBO(200, 220, 255, 1),
                        850,
                      ),
                      SkillItem(
                        "images/dialogflow_logo.png",
                        "Dialogflow",
                        Color.fromRGBO(250, 225, 200, 1),
                        900,
                      ),
                      SkillItem(
                        "images/unity_logo.png",
                        "Unity",
                        Color.fromRGBO(230, 230, 230, 1),
                        950,
                      ),
                      SkillItem(
                        "images/3ds_max_logo.png",
                        "3ds Max",
                        Color.fromRGBO(220, 230, 220, 1),
                        1000,
                      ),
                      SkillItem(
                        "images/php_logo.png",
                        "php",
                        Color.fromRGBO(200, 210, 245, 1),
                        1050,
                      ),
                      SkillItem(
                        "images/mysql_logo.png",
                        "MySql",
                        Color.fromRGBO(255, 240, 200, 1),
                        1100,
                      ),
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

class SkillItem extends StatefulWidget {
  final String _imageAssetName;
  final String _text;
  final Color _cardColor;
  final int _delayDuration;

  SkillItem(
      this._imageAssetName, this._text, this._cardColor, this._delayDuration)
      : super();

  @override
  _SkillItemState createState() => _SkillItemState();
}

class _SkillItemState extends State<SkillItem> {
  double _opacity = 0;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: widget._delayDuration), () {
      setState(() {
        _opacity = 1;
      });
    });
    bool isDesktop = true;
    var size = MediaQuery.of(context).size;
    if (size.width > size.height) {
      isDesktop = true;
    } else {
      isDesktop = false;
    }
    return AnimatedOpacity(
      opacity: _opacity,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: widget._cardColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: isDesktop ? 150 : 70,
                height: isDesktop ? 75 : 50,
                child: Image.asset(widget._imageAssetName),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                widget._text,
                style: TextStyle(
                  fontFamily: "Roboto",
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
