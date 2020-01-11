import 'package:flutter/material.dart';
import 'about.dart';
import 'article.dart';
import 'contact.dart';
import 'demo.dart';
import 'home.dart';
import 'open_source.dart';
import 'skills.dart';
import 'dart:core';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkTheme = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saeed Younus',
      theme: isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [
          HomePage(),
          // Align(
          //   alignment: Alignment(-1, 1),
          //   child: Column(
          //     children: <Widget>[
          //       FloatingActionButton(
          //         onPressed: () {
          //           setState(() {
          //             isDarkTheme = true;
          //           });
          //         },
          //         backgroundColor: Colors.black,
          //         splashColor: Colors.grey,
          //         child: Icon(
          //           Icons.format_color_fill,
          //           color: Colors.white,
          //         ),
          //       ),
          //       FloatingActionButton(
          //         onPressed: () {
          //           setState(() {
          //             isDarkTheme = false;
          //           });
          //         },
          //         splashColor: Colors.grey,
          //         backgroundColor: Colors.white,
          //         child: Icon(Icons.format_color_fill),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedPageIndex = 0;
  var _pageController = PageController();
  double currentPageValue = 0;

  Color _backgroundColor = Colors.red;
  bool _headerShadow = false;

  bool isDesktop = true;
  Size size;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentPageValue = _pageController.page;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
    if (size.width > 850) {
      isDesktop = true;
    } else {
      isDesktop = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    _pageController.addListener(offsetPageCallback);

    return Scaffold(
      appBar: isDesktop
          ? null
          : AppBar(
              title: getTitle(),
              centerTitle: true,
            ),
      drawer: isDesktop
          ? null
          : Drawer(
              child: Container(
                margin: EdgeInsets.only(top: 64),
                child: ListView(
                  children: <Widget>[
                    Column(
                      children: getMenuItems(),
                    ),
                  ],
                ),
              ),
            ),
      body: Container(
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
            Center(
              child: Text(
                "Hey!! This is Muhammad Saeed",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Roboto",
                  fontSize: Theme.of(context).textTheme.display2.fontSize,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // AnimatedBuilder(
            //   animation: _controller,
            //   child: Text(
            //     "Hey!! This is Muhammad Saeed",
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontFamily: "Roboto",
            //       fontSize: Theme.of(context).textTheme.display2.fontSize,
            //       fontWeight: FontWeight.w500,
            //     ),
            //     textAlign: TextAlign.center,
            //   ),
            //   builder: (BuildContext context, Widget widget) {
            //     return Opacity(
            //       opacity: _controller.value,
            //       child: Align(
            //         alignment: Alignment(
            //           0,
            //           0.4 - (0.1 * _controller.value),
            //         ),
            //         child: widget,
            //       ),
            //     );
            //   },
            // ),
            Column(
              children: <Widget>[
                //App Bar
                isDesktop
                    ? AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                        height: 60,
                        decoration: BoxDecoration(
                          boxShadow: _headerShadow
                              ? [
                                  BoxShadow(
                                    blurRadius: 5,
                                    offset: Offset(0, 5),
                                    color: Colors.black26,
                                  )
                                ]
                              : [],
                          color: Color(0xFF444444),
                        ),
                        child: Material(
                          color: Color(0xFF444444),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              getTitle(),
                              Container(
                                child: Row(
                                  children: getMenuItems(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox(),
                Expanded(
                  child: AnimatedContainer(
                    duration: Duration(
                      milliseconds: 400,
                    ),
                    child: PageView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 7,
                      pageSnapping: false,
                      itemBuilder: (context, index) {
                        // if (index == currentPageValue.floor()) {
                        //   print("floor() $index and $currentPageValue");
                        //   return Transform(
                        //     transform: Matrix4.identity()
                        //       ..translate(0,
                        //           (currentPageValue - index) * (size.height - 80))
                        //       ..scale(
                        //         ((currentPageValue - index) + 1).abs(),
                        //       ),
                        //     alignment: Alignment(0, 0),
                        //     child: getPage(index),
                        //   );
                        // } else if (index == currentPageValue.floor() + 1) {
                        //   print("(floor() + 1) $index and $currentPageValue");
                        //   return Transform(
                        //     transform: Matrix4.identity()..translate(0, 0),
                        //     alignment: Alignment(0, 1),
                        //     child: getPage(index),
                        //   );
                        // } else {
                        //   print("() $index and $currentPageValue");
                        //   return getPage(index);
                        // }
                        return getPage(index);
                      },
                      controller: _pageController,
                      physics: BouncingScrollPhysics(),
                      onPageChanged: (index) {
                        setState(() {
                          _selectedPageIndex = index;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getTitle() {
    return Container(
      margin: EdgeInsets.only(
        left: 16,
      ),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            color: Theme.of(context).primaryTextTheme.body1.color,
          ),
          children: [
            TextSpan(
              text: "M",
              style: TextStyle(
                fontFamily: 'Caveat',
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextSpan(
              text: "uhammad ",
              style: TextStyle(
                fontFamily: 'Caveat',
                fontSize: 20,
              ),
            ),
            TextSpan(
              text: "S",
              style: TextStyle(
                fontFamily: 'Caveat',
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextSpan(
              text: "aeed ",
              style: TextStyle(
                fontFamily: 'Caveat',
                fontSize: 20,
              ),
            ),
            TextSpan(
              text: "Y",
              style: TextStyle(
                fontFamily: 'Caveat',
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextSpan(
              text: "ounus",
              style: TextStyle(
                fontFamily: 'Caveat',
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> getMenuItems() {
    return [
      CircleButton(
        "Home",
        materialColor: Colors.red[200],
        shadowColor: Colors.redAccent,
        isSelected: _selectedPageIndex == 0,
        onPressed: () {
          _selectPage(0, Colors.red[900]);
        },
      ),
      CircleButton(
        "About Me",
        materialColor: Colors.orange[200],
        shadowColor: Colors.orangeAccent,
        isSelected: _selectedPageIndex == 1,
        onPressed: () {
          _selectPage(1, Colors.orange[900]);
        },
      ),
      CircleButton(
        "Skills",
        materialColor: Colors.yellow[200],
        shadowColor: Colors.yellowAccent,
        isSelected: _selectedPageIndex == 2,
        onPressed: () {
          _selectPage(2, Colors.yellow[900]);
        },
      ),
      CircleButton(
        "Open Source",
        materialColor: Colors.green[200],
        shadowColor: Colors.greenAccent,
        isSelected: _selectedPageIndex == 3,
        onPressed: () {
          _selectPage(3, Colors.green[900]);
        },
      ),
      CircleButton(
        "Demo",
        materialColor: Colors.blue[200],
        shadowColor: Colors.blueAccent,
        isSelected: _selectedPageIndex == 4,
        onPressed: () {
          _selectPage(4, Colors.blue[900]);
        },
      ),
      CircleButton(
        "Articles",
        materialColor: Colors.indigo[200],
        shadowColor: Colors.indigoAccent,
        isSelected: _selectedPageIndex == 5,
        onPressed: () {
          _selectPage(5, Colors.indigo[900]);
        },
      ),
      CircleButton(
        "Contact",
        materialColor: Colors.deepPurple[200],
        shadowColor: Colors.deepPurpleAccent,
        isSelected: _selectedPageIndex == 6,
        onPressed: () {
          _selectPage(6, Colors.deepPurple[900]);
        },
      ),
    ];
  }

  void offsetPageCallback() {
    var offset = _pageController.offset;
    setState(() {
      if (offset == 0) {
        _headerShadow = false;
      } else {
        _headerShadow = true;
      }
    });
  }

  void _selectPage(int index, Color backgroundColor) {
    setState(() {
      _selectedPageIndex = index;
      _backgroundColor = backgroundColor;
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 600),
        curve: Curves.decelerate,
      );
      if (!isDesktop) {
        Navigator.of(context).pop();
      }
    });
  }

  Widget getPage(int index) {
    if (index == 0) {
      return HomeScreen();
    }
    if (index == 1) {
      return Material(child: AboutScreen());
    }
    if (index == 2) {
      return Material(child: SkillScreen());
    }
    if (index == 3) {
      return Material(child: OpenSourceScreen());
    }
    if (index == 4) {
      return Material(child: DemoScreen());
    }
    if (index == 5) {
      return Material(child: ArticleScreen());
    }
    if (index == 6) {
      return Material(child: ContactScreen());
    } else {
      return Text(index.toString());
    }
  }

  @override
  void dispose() {
    _pageController.removeListener(offsetPageCallback);
    _pageController.dispose();
    super.dispose();
  }
}

class CircleButton extends StatefulWidget {
  final String text;
  bool isSelected = false;
  Color materialColor = Colors.red;
  Color shadowColor = Colors.redAccent;
  GestureTapCallback onPressed = () {};

  CircleButton(
    this.text, {
    this.isSelected,
    this.materialColor,
    this.shadowColor,
    this.onPressed,
  });

  @override
  _CircleButtonState createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  double _shadowElevation = 4;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Material(
        shape: RoundedRectangleBorder(),
        elevation: 0,
        color: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: widget.isSelected ? 100 : 0,
                  height: 2,
                  color: Colors.transparent,
                ),
              ],
            ),
            InkWell(
              onTap: widget.onPressed,
              hoverColor: Colors.black12,
              highlightColor: Colors.black38,
              splashColor: Colors.black54,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: AnimatedDefaultTextStyle(
                    duration: Duration(milliseconds: 300),
                    child: Text(
                      widget.text,
                      textAlign: TextAlign.center,
                    ),
                    style: TextStyle(
                      color:
                          widget.isSelected ? Colors.black : Color(0xefffffff),
                      fontFamily: "Roboto",
                      decoration: widget.isSelected
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fontSize: Theme.of(context).textTheme.body1.fontSize,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
