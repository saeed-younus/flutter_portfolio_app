import 'dart:ui';

import 'package:flutter/material.dart';

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
                    opacity: 0.8,
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
                            fontFamily: "Roboto",
                            fontSize: isDesktop
                                ? Theme.of(context).textTheme.display2.fontSize
                                : Theme.of(context).textTheme.display1.fontSize,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        RichText(
                          text: TextSpan(
                            text: "I am ",
                            children: [
                              TextSpan(
                                text:
                                    "Android, PHP, Unity and Flutter developer. ",
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  color:
                                      Theme.of(context).textTheme.title.color,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "I am tech-enthusiast and always keen for sharing my knowledge to others. ",
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                ),
                              ),
                              TextSpan(
                                text:
                                    "Programming is my passion. Love android, flutter and creative designs.",
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                ),
                              ),
                              TextSpan(
                                text:
                                    "\nI am always looking for my weakness and thankful to those who teach, support and pray for me.\n",
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  color:
                                      Theme.of(context).textTheme.title.color,
                                ),
                              ),
                            ],
                            style: TextStyle(
                              fontFamily: "Roboto",
                              color: Theme.of(context).textTheme.caption.color,
                              fontSize: isDesktop
                                  ? Theme.of(context).textTheme.title.fontSize
                                  : Theme.of(context).textTheme.title.fontSize,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        isDesktop
                            ? SizedBox()
                            : Container(
                                margin: EdgeInsets.only(top: 16),
                                child: Opacity(
                                  opacity: 0.8,
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
