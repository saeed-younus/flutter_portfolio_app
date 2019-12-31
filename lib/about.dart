import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

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
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return Container(
      child: Row(
        children: <Widget>[
          isDesktop
              ? Expanded(
                  child: Opacity(
                    opacity: 0.3,
                    child: Image.asset(
                      "images/about_1.jpg",
                      fit: BoxFit.cover,
                      alignment: Alignment(-1, 0.5),
                    ),
                  ),
                )
              : const SizedBox(),
          isDesktop ? const SizedBox(width: 32) : const SizedBox(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(32),
              child: Stack(
                children: <Widget>[
                  AnimatedBuilder(
                    animation: _controller,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "About Me!\n",
                          style: TextStyle(
                            fontFamily: "Comfortaa",
                            fontSize: isDesktop
                                ? Theme.of(context).textTheme.display2.fontSize
                                : Theme.of(context).textTheme.display1.fontSize,
                            fontWeight:
                                Theme.of(context).textTheme.display1.fontWeight,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: "I am ",
                            children: [
                              TextSpan(
                                text:
                                    "Android, PHP, Unity and Flutter developer. ",
                                style: TextStyle(
                                  fontFamily: "Comfortaa",
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "I am tech-enthsuast and always keen for sharing my knowledge to others. ",
                                style: TextStyle(
                                  fontFamily: "Comfortaa",
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "Programming is my passion. Love android, flutter and creative designs.",
                                style: TextStyle(
                                  fontFamily: "Comfortaa",
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "\nI am always looking for my weakness and thankful to those who teach, support and pray for me.\n",
                                style: TextStyle(
                                  fontFamily: "Comfortaa",
                                  color: Colors.white,
                                ),
                              ),
                            ],
                            style: TextStyle(
                              fontFamily: "Comfortaa",
                              color: Colors.white54,
                              fontSize: isDesktop
                                  ? Theme.of(context)
                                      .textTheme
                                      .headline
                                      .fontSize
                                  : Theme.of(context).textTheme.title.fontSize,
                              fontWeight:
                                  Theme.of(context).textTheme.body2.fontWeight,
                            ),
                          ),
                        ),
                        isDesktop
                            ? SizedBox()
                            : Expanded(
                                child: Opacity(
                                  opacity: 0.3,
                                  child: Image.asset(
                                    "images/about_1.jpg",
                                    fit: BoxFit.cover,
                                    alignment: Alignment(-1, 0),
                                  ),
                                ),
                              ),
                      ],
                    ),
                    builder: (BuildContext context, Widget widget) {
                      return Opacity(
                        opacity: _controller.value,
                        child: Align(
                          alignment: Alignment(
                            0,
                            0.2 - (0.2 * _controller.value),
                          ),
                          child: widget,
                        ),
                      );
                    },
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
