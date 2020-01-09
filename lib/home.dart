import 'dart:ui';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
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
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Opacity(
                  opacity: 0.75,
                  child: Image.asset(
                    "images/about_2.jpg",
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.low,
                    alignment: const Alignment(0, -0.25),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).canvasColor,
                        Colors.transparent,
                      ],
                      begin: Alignment(0, 1),
                      end: Alignment(0, 0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          AnimatedBuilder(
            animation: _controller,
            child: Text(
              "Hey!! This is Muhammad Saeed",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Roboto",
                fontSize: Theme.of(context).textTheme.display2.fontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
            builder: (BuildContext context, Widget widget) {
              return Opacity(
                opacity: _controller.value,
                child: Align(
                  alignment: Alignment(
                    0,
                    0.4 - (0.1 * _controller.value),
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
