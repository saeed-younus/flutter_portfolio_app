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
      padding: const EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
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
                          style: TextStyle(
                            fontFamily: "Comfortaa",
                            color: Colors.white60,
                            fontSize: isDesktop
                                ? Theme.of(context).textTheme.display2.fontSize
                                : Theme.of(context).textTheme.display1.fontSize,
                            fontWeight:
                                Theme.of(context).textTheme.display2.fontWeight,
                          ),
                        ),
                        TextSpan(
                          text: "Flutter",
                        ),
                      ],
                      style: TextStyle(
                        fontFamily: "Comfortaa",
                        color: Colors.white,
                        fontSize: isDesktop
                            ? Theme.of(context).textTheme.display2.fontSize
                            : Theme.of(context).textTheme.display1.fontSize,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Center(
                    child: isDesktop
                        ? SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.asset("images/flutter_icon.png"),
                          )
                        : const SizedBox(),
                  ),
                ],
              ),
            ),
          ),
          isDesktop
              ? AspectRatio(
                  aspectRatio: 10 / 16,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: AspectRatio(
                          aspectRatio: 10 / 16,
                          child: MaterialApp(
                            debugShowCheckedModeBanner: false,
                            theme: ThemeData.light(),
                            home: getDemo(),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "You can run the demo by using common gestures. And change demo by clicking below buttons.",
                    style: TextStyle(
                      fontFamily: "Comfortaa",
                      color: Colors.white60,
                      fontSize: isDesktop
                          ? Theme.of(context).textTheme.headline.fontSize
                          : Theme.of(context).textTheme.title.fontSize,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    if (isDesktop) {
                      setState(() {
                        _demoType = DemoEnum.whatsapp;
                      });
                    } else {
                      _demoType = DemoEnum.whatsapp;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MaterialApp(
                              debugShowCheckedModeBanner: false,
                              theme: ThemeData.light(),
                              home: getDemo(),
                            );
                          },
                        ),
                      );
                    }
                  },
                  padding: const EdgeInsets.all(8),
                  color: Colors.black54,
                  child: Text(
                    "Whatsapp",
                    style: TextStyle(
                      fontFamily: "Comfortaa",
                      color: _demoType == DemoEnum.whatsapp
                          ? Colors.lightGreenAccent
                          : Colors.white70,
                      fontSize: isDesktop
                          ? Theme.of(context).textTheme.headline.fontSize
                          : Theme.of(context).textTheme.title.fontSize,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                RaisedButton(
                  onPressed: () {
                    if (isDesktop) {
                      setState(() {
                        _demoType = DemoEnum.instagram;
                      });
                    } else {
                      _demoType = DemoEnum.instagram;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MaterialApp(
                              debugShowCheckedModeBanner: false,
                              theme: ThemeData.light(),
                              home: getDemo(),
                            );
                          },
                        ),
                      );
                    }
                  },
                  padding: const EdgeInsets.all(8),
                  color: Colors.black54,
                  child: Text(
                    "Instagram",
                    style: TextStyle(
                      fontFamily: "Comfortaa",
                      color: _demoType == DemoEnum.instagram
                          ? Colors.pinkAccent
                          : Colors.white70,
                      fontSize: isDesktop
                          ? Theme.of(context).textTheme.headline.fontSize
                          : Theme.of(context).textTheme.title.fontSize,
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
