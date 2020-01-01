import 'package:flutter/material.dart';
import 'about.dart';
import 'article.dart';
import 'contact.dart';
import 'demo.dart';
import 'home.dart';
import 'open_source.dart';
import 'skills.dart';

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

  Color _backgroundColor = Colors.red;
  bool _headerShadow = false;

  bool isDesktop = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var size = MediaQuery.of(context).size;
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
        child: Column(
          children: <Widget>[
            //App Bar
            isDesktop
                ? AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                    height: 80,
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
                      color: Theme.of(context).primaryColorDark,
                    ),
                    child: Material(
                      elevation: 0,
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
        materialColor: Colors.red,
        shadowColor: Colors.redAccent,
        isSelected: _selectedPageIndex == 0,
        onPressed: () {
          _selectPage(0, Colors.red[900]);
        },
      ),
      CircleButton(
        "About Me",
        materialColor: Colors.orange,
        shadowColor: Colors.orangeAccent,
        isSelected: _selectedPageIndex == 1,
        onPressed: () {
          _selectPage(1, Colors.orange[900]);
        },
      ),
      CircleButton(
        "Skills",
        materialColor: Colors.yellow,
        shadowColor: Colors.yellowAccent,
        isSelected: _selectedPageIndex == 2,
        onPressed: () {
          _selectPage(2, Colors.yellow[900]);
        },
      ),
      CircleButton(
        "Open Source",
        materialColor: Colors.green,
        shadowColor: Colors.greenAccent,
        isSelected: _selectedPageIndex == 3,
        onPressed: () {
          _selectPage(3, Colors.green[900]);
        },
      ),
      CircleButton(
        "Demo",
        materialColor: Colors.blue,
        shadowColor: Colors.blueAccent,
        isSelected: _selectedPageIndex == 4,
        onPressed: () {
          _selectPage(4, Colors.blue[900]);
        },
      ),
      CircleButton(
        "Articles",
        materialColor: Colors.indigo,
        shadowColor: Colors.indigoAccent,
        isSelected: _selectedPageIndex == 5,
        onPressed: () {
          _selectPage(5, Colors.indigo[900]);
        },
      ),
      CircleButton(
        "Contact",
        materialColor: Colors.deepPurple,
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
      return AboutScreen();
    }
    if (index == 2) {
      return SkillScreen();
    }
    if (index == 3) {
      return OpenSourceScreen();
    }
    if (index == 4) {
      return DemoScreen();
    }
    if (index == 5) {
      return ArticleScreen();
    }
    if (index == 6) {
      return ContactScreen();
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
    return Container(
      margin: EdgeInsets.all(4),
      child: SizedBox(
        width: 80,
        height: 80,
        child: Material(
          shape: CircleBorder(),
          elevation: 0,
          child: Stack(
            children: <Widget>[
              AnimatedCrossFade(
                crossFadeState: widget.isSelected
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: Duration(milliseconds: 300),
                firstChild: Material(
                  shape: CircleBorder(),
                  color: Color.fromRGBO(0, 0, 0, 0),
                  child: SizedBox(width: 80, height: 80),
                ),
                secondChild: Material(
                  shape: CircleBorder(),
                  color: widget.materialColor,
                  child: SizedBox(width: 80, height: 80),
                ),
              ),
              InkWell(
                onTap: widget.onPressed,
                child: Center(
                  child: Text(
                    widget.text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: widget.isSelected ? Colors.white : Colors.white54,
                      fontFamily: "Comfortaa",
                      fontSize: Theme.of(context).textTheme.body1.fontSize,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
