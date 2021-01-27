import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:web_portfolio/about.dart';
import 'package:web_portfolio/article.dart';
import 'package:web_portfolio/contact.dart';
import 'package:web_portfolio/demo.dart';
import 'package:web_portfolio/home.dart';
import 'package:web_portfolio/main.dart';
import 'package:web_portfolio/open_source.dart';
import 'package:web_portfolio/skills.dart';

class AppDataWidget extends InheritedWidget {
  final ValueNotifier<bool> isDarkTheme = ValueNotifier(false);

  AppDataWidget({@required Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(AppDataWidget oldWidget) {
    return isDarkTheme != oldWidget.isDarkTheme;
  }

  static AppDataWidget of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<AppDataWidget>());
  }
}

class EntryScreen extends StatelessWidget {
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
          home: MyApp(),
        );
      },
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDesktop = true;
  Size size;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  var _scrollController = PageController();
  var _selectedPageIndex = 0;
  double _scrollOffset = 0;

  bool isNavigating = false;

  double currentPageOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        currentPageOffset = _scrollController.page;
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
          home: Scaffold(
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
            floatingActionButton: FloatingActionButton(
              child: isDark
                  ? Icon(Icons.brightness_high)
                  : Icon(Icons.brightness_3),
              backgroundColor: isDark ? Colors.white : Colors.black,
              onPressed: () {
                setState(
                  () {
                    AppDataWidget.of(context).isDarkTheme.value = !isDark;
                  },
                );
              },
            ),
            body: Container(
              child: Stack(
                children: [
                  Listener(
                    onPointerSignal: (PointerSignalEvent details) {
                      if (isNavigating) {
                        debugPrint("Navigating");
                        return;
                      }
                      debugPrint("Not Navigating");
                      if (details is PointerScrollEvent) {
                        if (details.scrollDelta.dy >= 1.5) {
                          isNavigating = true;
                          nextPage();
                        } else if (details.scrollDelta.dy <= -1.5) {
                          isNavigating = true;
                          previousPage();
                        }
                      }
                    },
                    child: GestureDetector(
                      onVerticalDragUpdate: (DragUpdateDetails details) {
                        if (isNavigating) {
                          debugPrint("Navigating");
                          return;
                        }
                        debugPrint("Not Navigating");
                        if (details.delta.dy < -2) {
                          nextPage();
                        } else if (details.delta.dy > 2) {
                          previousPage();
                        }
                      },
                      child: PageView.builder(
                        controller: _scrollController,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          if (index == currentPageOffset.floor()) {
                            return Transform(
                              transform: Matrix4.identity()
                                ..translate(
                                    0,
                                    (currentPageOffset - index) *
                                        (size.height - 20)),
//                                ..scale((((index - currentPageOffset) / 100) + 1)
//                                    .abs()),
                              alignment: Alignment(0, 0),
                              child: getPage(index),
                            );
                          } else if (index == currentPageOffset.floor() + 1) {
                            return Transform(
                              transform: Matrix4.identity()..translate(0, 0),
                              alignment: Alignment(0, 1),
                              child: getPage(index),
                            );
                          } else {
                            return getPage(index);
                          }
                        },
                      ),
                    ),
                  ),
                  isDesktop
                      ? AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Color(0x00444444),
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
          ),
        );
      },
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
            color: Theme.of(context).textTheme.bodyText1.color,
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
          setPage(0);
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
          setPage(1);
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
          setPage(2);
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
          setPage(3);
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
          setPage(4);
          if (!isDesktop) {
            Navigator.of(context).pop();
          }
        },
      ),
      CircleButton(
        "Articles",
        materialColor: Colors.indigo[200],
        shadowColor: Colors.indigoAccent,
        isSelected: _selectedPageIndex == 5,
        onPressed: () {
          setPage(5);
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
          setPage(6);
          if (!isDesktop) {
            Navigator.of(context).pop();
          }
          // _selectPage(6, Colors.deepPurple[900]);
        },
      ),
    ];
  }

  void nextPage() {
    debugPrint("Next Page");
    if (_selectedPageIndex < 6) {
      isNavigating = true;
      restoreNavigation();
      setState(() {
        _selectedPageIndex++;
        _scrollController.animateToPage(
          _selectedPageIndex,
          duration: Duration(milliseconds: 700),
          curve: Curves.easeInOutQuart,
        );
      });
    }
  }

  void previousPage() {
    debugPrint("Previous Page");
    if (_selectedPageIndex > 0) {
      isNavigating = true;
      restoreNavigation();
      setState(() {
        _selectedPageIndex--;
        _scrollController.animateToPage(
          _selectedPageIndex,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInQuint,
        );
      });
    }
  }

  void setPage(int index) {
    isNavigating = true;
    restoreNavigation();
    setState(() {
      _selectedPageIndex = index;
      _scrollController.animateToPage(
        _selectedPageIndex,
        duration: Duration(milliseconds: 900),
        curve: Curves.easeInOutCubic,
      );
    });
  }

  Widget getPage(int index) {
    if (index == 0) {
      return Container(height: size.height, child: HomeScreen());
    }
    if (index == 1) {
      return Container(
          height: size.height, child: Material(child: AboutScreen()));
    }
    if (index == 2) {
      return Container(
          height: size.height, child: Material(child: SkillScreen()));
    }
    if (index == 3) {
      return Container(
          height: size.height, child: Material(child: OpenSourceScreen()));
    }
    if (index == 4) {
      return Container(
          height: size.height, child: Material(child: DemoScreen()));
    }
    if (index == 5) {
      return Container(
          height: size.height, child: Material(child: ArticleScreen()));
    }
    if (index == 6) {
      return Container(
          height: size.height, child: Material(child: ContactScreen()));
    } else {
      return Text(index.toString());
    }
  }

  Future restoreNavigation() async {
    Future.delayed(Duration(milliseconds: 1000), () {
      isNavigating = false;
    });
  }
}
