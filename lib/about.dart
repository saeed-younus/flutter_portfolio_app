import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen>
    with TickerProviderStateMixin {
  AnimationController _fadeAnimationController;
  AnimationController _scaleAnimationController;

  bool isDesktop = true;

  Size size;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
    if (size.width > size.height) {
      isDesktop = true;
    } else {
      isDesktop = false;
    }
  }

  @override
  void initState() {
    super.initState();
    _fadeAnimationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimationController.value = 0;
    Future.delayed(Duration(milliseconds: 400), () {
      _fadeAnimationController.forward();
    });
  }

  @override
  void dispose() {
    // _fadeAnimationController.dispose();
    _scaleAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    Future.delayed(Duration(seconds: isDesktop ? 1 : 0), () {
//      _scaleAnimationController.forward();
//    });
    return Container(
      child: Stack(
        children: <Widget>[
          isDesktop
              ? Align(
                  alignment: Alignment(-0.75, 0),
                  child: SizedBox(
                    width: size.width / 3,
                    height: size.height - 60,
                    child: Image.asset(
                      "images/about_1.jpg",
                      fit: BoxFit.cover,
                      alignment: Alignment(0, 0.5),
                    ),
                  ),
                )
              : const SizedBox(),
          isDesktop ? const SizedBox(width: 32) : const SizedBox(),
          AnimatedBuilder(
            animation: _fadeAnimationController,
            child: Container(
              padding: const EdgeInsets.all(32),
              width: isDesktop ? size.width * 0.6 : size.width,
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
                          text: "Android, PHP, Unity and Flutter developer. ",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            color: Theme.of(context).textTheme.title.color,
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
                            color: Theme.of(context).textTheme.title.color,
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
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            builder: (BuildContext context, Widget widget) {
              return Opacity(
                opacity: _fadeAnimationController.value,
                child: Align(
                  alignment: Alignment(
                    isDesktop
                        ? (1) - (_fadeAnimationController.value * 0.2)
                        : 0,
                    0,
                  ),
                  child: widget,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
