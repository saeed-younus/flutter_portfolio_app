import 'dart:ui';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {
  AnimationController _fadeAnimationController;

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
  }

  @override
  void dispose() {
    _fadeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 1000), () {
      _fadeAnimationController.forward();
    });
    return Container(
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Image.asset(
                  "images/about_2.jpg",
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.low,
                  alignment: const Alignment(0, -0.25),
                ),
              ),
            ],
          ),
          AnimatedBuilder(
            animation: _fadeAnimationController,
            child: Text(
              "Hey!! This is Muhammad Saeed",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Roboto",
                fontSize: Theme.of(context).textTheme.display2.fontSize,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            builder: (BuildContext context, Widget widget) {
              return Opacity(
                opacity: _fadeAnimationController.value,
                child: Align(
                  alignment: Alignment(
                    0,
                    0.4 - (0.1 * _fadeAnimationController.value),
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
