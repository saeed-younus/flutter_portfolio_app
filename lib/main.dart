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

void main() => runApp(AppDataWidget(child: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AppDataWidget.of(context).isDarkTheme,
      builder: (BuildContext context, bool isDark, Widget child) {
        return MaterialApp(
          title: 'Saeed Younus',
          theme: isDark
              ? ThemeData(
                  brightness: Brightness.dark,
                  primaryColor: Color(0xff222222),
                )
              : ThemeData(
                  brightness: Brightness.light,
                  primaryColor: Color(0xfffefefe),
                ),
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
      },
    );
  }
}

class AppDataWidget extends InheritedWidget {
  ValueNotifier<bool> isDarkTheme = ValueNotifier(false);

  AppDataWidget({@required Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(AppDataWidget oldWidget) {
    return isDarkTheme != oldWidget.isDarkTheme;
  }

  static AppDataWidget of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<AppDataWidget>());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedPageIndex = 0;
  var _pageController = PageController();
  var _scrollController = ScrollController();
  double currentPageValue = 0;

  double scrollOffset = 0;

  Color _backgroundColor = Colors.red;
  bool _showHeaderColor = false;

  double pageOffset = 0;

  bool isDesktop = true;
  Size size;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  GlobalKey contactKey = GlobalKey();
  GlobalKey skillKey = GlobalKey();
  GlobalKey articleKey = GlobalKey();
  GlobalKey openSourceKey = GlobalKey();
  GlobalKey demoKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentPageValue = _pageController.page;
      });
    });
    _scrollController.addListener(() {
      setState(() {
        scrollOffset = _scrollController.offset;
        pageOffset = scrollOffset;
        if (scrollOffset >= size.height - 60) {
          _showHeaderColor = true;
        } else {
          _showHeaderColor = false;
        }

        if ((contactKey.currentContext.findRenderObject() as RenderBox)
                .localToGlobal(Offset.zero)
                .dy <=
            size.height / 2) {
          _selectedPageIndex = 6;
        } else if ((articleKey.currentContext.findRenderObject() as RenderBox)
                .localToGlobal(Offset.zero)
                .dy <=
            size.height / 2) {
          _selectedPageIndex = 5;
        } else if ((demoKey.currentContext.findRenderObject() as RenderBox)
                .localToGlobal(Offset.zero)
                .dy <=
            size.height / 2) {
          _selectedPageIndex = 4;
        } else if ((openSourceKey.currentContext.findRenderObject()
                    as RenderBox)
                .localToGlobal(Offset.zero)
                .dy <=
            size.height / 2) {
          _selectedPageIndex = 3;
        } else if ((skillKey.currentContext.findRenderObject() as RenderBox)
                .localToGlobal(Offset.zero)
                .dy <=
            size.height / 2) {
          _selectedPageIndex = 2;
        } else if (scrollOffset >= size.height / 2) {
          _selectedPageIndex = 1;
        } else {
          _selectedPageIndex = 0;
        }
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
      key: _scaffoldKey,
      drawer: isDesktop
          ? null
          : Drawer(
              child: Container(
                child: ListView(
                  children: <Widget>[
                    Column(
                      children: [
                        SizedBox(height: 64),
                        getTitle(),
                        SizedBox(height: 32),
                        ...getMenuItems(),
                      ],
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
                  child: Transform(
                    transform: Matrix4.identity()
                      ..scale(1 + (pageOffset / (size.height * 2)))
                      ..translate(0, 0 + pageOffset / 8),
                    origin: Offset(size.width / 2, size.height / 2),
                    child: Opacity(
                      opacity: 1,
                      child: Image.asset(
                        "images/about_2.jpg",
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.low,
                        alignment: Alignment(0, 0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Transform(
              transform: Matrix4.identity()
                ..scale(1 + (pageOffset / (size.height * 2)))
                ..translate(0, 0 - pageOffset / 8),
              origin: Offset(size.width / 2, size.height / 2),
              child: Center(
                child: Text(
                  "Hey!! This is Muhammad Saeed",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: Theme.of(context).textTheme.display2.fontSize,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
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
            // Column(
            //   children: <Widget>[
            //     Expanded(
            //       child: PageView.builder(
            //         scrollDirection: Axis.vertical,
            //         itemCount: 7,
            //         pageSnapping: false,
            //         itemBuilder: (context, index) {
            //           // if (index == currentPageValue.floor()) {
            //           //   print("floor() $index and $currentPageValue");
            //           //   return Transform(
            //           //     transform: Matrix4.identity()
            //           //       ..translate(0,
            //           //           (currentPageValue - index) * (size.height - 80))
            //           //       ..scale(
            //           //         ((currentPageValue - index) + 1).abs(),
            //           //       ),
            //           //     alignment: Alignment(0, 0),
            //           //     child: getPage(index),
            //           //   );
            //           // } else if (index == currentPageValue.floor() + 1) {
            //           //   print("(floor() + 1) $index and $currentPageValue");
            //           //   return Transform(
            //           //     transform: Matrix4.identity()..translate(0, 0),
            //           //     alignment: Alignment(0, 1),
            //           //     child: getPage(index),
            //           //   );
            //           // } else {
            //           //   print("() $index and $currentPageValue");
            //           //   return getPage(index);
            //           // }
            //           return getPage(index);
            //         },
            //         controller: _pageController,
            //         physics: BouncingScrollPhysics(),
            //         onPageChanged: (index) {
            //           setState(() {
            //             _selectedPageIndex = index;
            //           });
            //         },
            //       ),
            //     ),
            //   ],
            // ),
            CustomScrollView(
              controller: _scrollController,
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: size.height,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    color: Theme.of(context).canvasColor,
                    child: AboutScreen(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    key: skillKey,
                    color: Theme.of(context).canvasColor,
                    child: SkillScreen(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    key: openSourceKey,
                    color: Theme.of(context).canvasColor,
                    height: size.height,
                    child: OpenSourceScreen(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    key: demoKey,
                    height: size.height,
                    color: Theme.of(context).canvasColor,
                    child: DemoScreen(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    key: articleKey,
                    height: size.height,
                    color: Theme.of(context).canvasColor,
                    child: ArticleScreen(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    key: contactKey,
                    constraints: BoxConstraints(minHeight: size.height),
                    color: Theme.of(context).canvasColor,
                    child: ContactScreen(),
                  ),
                ),
              ],
            ),
            isDesktop
                ? AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                    height: 60,
                    decoration: BoxDecoration(
                      color: _showHeaderColor
                          ? Theme.of(context).primaryColor
                          : Color(0x00444444),
                    ),
                    child: Material(
                      color: Color(0x00444444),
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
                : SizedBox(
                    child: IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        setState(() {
                          _scaffoldKey.currentState.openDrawer();
                        });
                      },
                    ),
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
            color: Theme.of(context).textTheme.body1.color,
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
          _scrollController.animateTo(
            0,
            duration: Duration(milliseconds: 700),
            curve: Curves.ease,
          );
          if (!isDesktop) {
            Navigator.of(context).pop();
          }
          // _selectPage(0, Colors.red[900]);
        },
      ),
      CircleButton(
        "About Me",
        materialColor: Colors.orange[200],
        shadowColor: Colors.orangeAccent,
        isSelected: _selectedPageIndex == 1,
        onPressed: () {
          _scrollController.animateTo(
            isDesktop ? size.height - 60 : size.height,
            duration: Duration(milliseconds: 700),
            curve: Curves.ease,
          );
          if (!isDesktop) {
            Navigator.of(context).pop();
          }
          // _selectPage(1, Colors.orange[900]);
        },
      ),
      CircleButton(
        "Skills",
        materialColor: Colors.yellow[200],
        shadowColor: Colors.yellowAccent,
        isSelected: _selectedPageIndex == 2,
        onPressed: () {
          _scrollController.animateTo(
            (skillKey.currentContext.findRenderObject() as RenderBox)
                    .localToGlobal(Offset(0, _scrollController.offset))
                    .dy -
                (isDesktop ? 60 : 0),
            duration: Duration(milliseconds: 700),
            curve: Curves.ease,
          );
          if (!isDesktop) {
            Navigator.of(context).pop();
          }
          // _selectPage(2, Colors.yellow[900]);
        },
      ),
      CircleButton(
        "Open Source",
        materialColor: Colors.green[200],
        shadowColor: Colors.greenAccent,
        isSelected: _selectedPageIndex == 3,
        onPressed: () {
          _scrollController.animateTo(
            (openSourceKey.currentContext.findRenderObject() as RenderBox)
                    .localToGlobal(Offset(0, _scrollController.offset))
                    .dy -
                (isDesktop ? 60 : 0),
            duration: Duration(milliseconds: 700),
            curve: Curves.ease,
          );
          if (!isDesktop) {
            Navigator.of(context).pop();
          }
          // _selectPage(3, Colors.green[900]);
        },
      ),
      CircleButton(
        "Demo",
        materialColor: Colors.blue[200],
        shadowColor: Colors.blueAccent,
        isSelected: _selectedPageIndex == 4,
        onPressed: () {
          _scrollController.animateTo(
            (demoKey.currentContext.findRenderObject() as RenderBox)
                    .localToGlobal(Offset(0, _scrollController.offset))
                    .dy -
                (isDesktop ? 60 : 0),
            duration: Duration(milliseconds: 700),
            curve: Curves.ease,
          );
          if (!isDesktop) {
            Navigator.of(context).pop();
          }
          // _selectPage(4, Colors.blue[900]);
        },
      ),
      CircleButton(
        "Articles",
        materialColor: Colors.indigo[200],
        shadowColor: Colors.indigoAccent,
        isSelected: _selectedPageIndex == 5,
        onPressed: () {
          _scrollController.animateTo(
            (articleKey.currentContext.findRenderObject() as RenderBox)
                    .localToGlobal(Offset(0, _scrollController.offset))
                    .dy -
                (isDesktop ? 60 : 0),
            duration: Duration(milliseconds: 700),
            curve: Curves.ease,
          );

          if (!isDesktop) {
            Navigator.of(context).pop();
          }
          // _selectPage(5, Colors.indigo[900]);
        },
      ),
      CircleButton(
        "Contact",
        materialColor: Colors.deepPurple[200],
        shadowColor: Colors.deepPurpleAccent,
        isSelected: _selectedPageIndex == 6,
        onPressed: () {
          _scrollController.animateTo(
            (contactKey.currentContext.findRenderObject() as RenderBox)
                    .localToGlobal(Offset(0, _scrollController.offset))
                    .dy -
                (isDesktop ? 60 : 0),
            duration: Duration(milliseconds: 700),
            curve: Curves.ease,
          );

          if (!isDesktop) {
            Navigator.of(context).pop();
          }
          // _selectPage(6, Colors.deepPurple[900]);
        },
      ),
    ];
  }

  void offsetPageCallback() {
    var offset = _pageController.offset;
    setState(() {
      if (offset <= size.height) {
        pageOffset = offset;
        _showHeaderColor = false;
      } else {
        _showHeaderColor = true;
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
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  AnimatedContainer(
                    duration: Duration(milliseconds: 400),
                    width: widget.isSelected ? 88 : 0,
                    alignment: Alignment(0, 0),
                    height: 2,
                    color: Colors.black54,
                  ),
                ],
              ),
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
                      color: Theme.of(context).textTheme.title.color,
                      fontFamily: "Roboto",
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
