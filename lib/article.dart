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
      child: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                child: Center(
                  child: Container(
                    height: 340,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        SizedBox(width: isDesktop ? 500 : 250),
                        ArticleCardItem(
                          "images/android_logo.png",
                          "ViewModel with ViewModelProvider.Factory",
                          "Why and when we use ViewModelProvider.Factory for ViewModel.",
                          Colors.greenAccent,
                          () {
                            js.context.callMethod("open", [
                              "https://medium.com/koderlabs/viewmodel-with-viewmodelprovider-factory-the-creator-of-viewmodel-8fabfec1aa4f"
                            ]);
                          },
                        ),
                        ArticleCardItem(
                          "images/android_logo.png",
                          "Motion Layout: Card Shuffle Animation",
                          "In this article you will find how motion layout is easy and cool by creating card shuffle animation.",
                          Colors.greenAccent,
                          () {
                            js.context.callMethod("open", [
                              "https://medium.com/@sendtosaeed2/motion-layout-card-shuffle-animation-810e7978e8d0"
                            ]);
                          },
                        ),
                        ArticleCardItem(
                          "images/flutter_icon.png",
                          "Flutter: Material + Cupertino make together",
                          "Run material widgets on Cupertino app or run cupertino widgets on Material App.",
                          Colors.lightBlue[200],
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
                          Theme.of(context).scaffoldBackgroundColor,
                          Color.fromRGBO(
                            Theme.of(context).scaffoldBackgroundColor.red,
                            Theme.of(context).scaffoldBackgroundColor.green,
                            Theme.of(context).scaffoldBackgroundColor.blue,
                            0,
                          ),
                        ],
                        begin: const Alignment(-0.95, 0),
                        end: const Alignment(0.1, 0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Published \nArticles",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: isDesktop
                        ? Theme.of(context).textTheme.display2.fontSize
                        : Theme.of(context).textTheme.display1.fontSize,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ArticleCardItem extends StatelessWidget {
  String image;
  String title;
  String description;
  Color titleColor;
  VoidCallback onTap;

  ArticleCardItem(
    this.image,
    this.title,
    this.description,
    this.titleColor,
    this.onTap,
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
    return Container(
      width: 320,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
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
                const SizedBox(height: 16),
                SizedBox(
                  height: 80,
                  child: Text(
                    title,
                    style: TextStyle(
                      color: titleColor,
                      fontFamily: "Roboto",
                      fontSize: isDesktop
                          ? Theme.of(context).textTheme.headline.fontSize
                          : Theme.of(context).textTheme.title.fontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  description,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
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
