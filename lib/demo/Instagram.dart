import 'package:flutter/material.dart';
import 'instagram/Home.dart';

class Instagram extends StatefulWidget {
  @override
  State createState() {
    return _Instagram();
  }
}

class _Instagram extends State<Instagram> with TickerProviderStateMixin {
  TabController tabController;
  AnimationController fadeAnimationController;
  AnimationController translateAnimationController;
  Animation<double> fadeAnimation;
  Animation<double> translateAnimation;

  final int whatsAppAppBarColor = 0xFF128c7e;
  final int primaryDarkColor = 0xFF075e54;
  static final int secondaryColor = 0xFF25d366;
  final int secondaryBlueColor = 0xFF34b7f1;
  final int bgLightGreenColor = 0xFFdcf8c6;
  final int bgGrayColor = 0xFFece5dd;

  List<bool> isBottomItemIndexSelected = [];
  Widget screen = HomeInstagram();

  @override
  void initState() {
    super.initState();
    fadeAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: fadeAnimationController, curve: Curves.easeIn));
    translateAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    translateAnimation =
        Tween(begin: 1.0, end: 0.0).animate(translateAnimationController);

    isBottomItemIndexSelected = [true, false, false, false, false];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(),
        body: HomeInstagram(),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.black12, width: 1.0)),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: getIcon(
                      "images/home_unselected.png",
                      selectedImage: "images/home_selected.png",
                      isSelected: isBottomItemIndexSelected[0],
                    ),
                    onPressed: () {
                      setState(() {
                        isBottomItemIndexSelected = [
                          true,
                          false,
                          false,
                          false,
                          false
                        ];
                      });
                    }),
              ),
              Expanded(
                child: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: getIcon(
                      "images/search_unselected.png",
                      selectedImage: "images/search_selected.png",
                      isSelected: isBottomItemIndexSelected[1],
                    ),
                    onPressed: () {
                      setState(() {
                        isBottomItemIndexSelected = [
                          false,
                          true,
                          false,
                          false,
                          false
                        ];
                      });
                    }),
              ),
              Expanded(
                child: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: getIcon(
                      "images/add_unselected.png",
                      selectedImage: "images/add_selected.png",
                      isSelected: isBottomItemIndexSelected[2],
                    ),
                    onPressed: () {
                      setState(() {
                        isBottomItemIndexSelected = [
                          false,
                          false,
                          true,
                          false,
                          false
                        ];
                      });
                    }),
              ),
              Expanded(
                child: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: getIcon(
                      "images/heart_unselected.png",
                      selectedImage: "images/heart_selected.png",
                      isSelected: isBottomItemIndexSelected[3],
                    ),
                    onPressed: () {
                      setState(() {
                        isBottomItemIndexSelected = [
                          false,
                          false,
                          false,
                          true,
                          false
                        ];
                      });
                    }),
              ),
              Expanded(
                child: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: getIcon(
                      "images/profile_unselected.png",
                      selectedImage: "images/profile_selected.png",
                      isSelected: isBottomItemIndexSelected[4],
                    ),
                    onPressed: () {
                      setState(() {
                        isBottomItemIndexSelected = [
                          false,
                          false,
                          false,
                          false,
                          true
                        ];
                      });
                    }),
              ),
            ],
          ),
        )
        /*BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 2,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset("images/home_unselected.png", width: 24.0, height: 24.0,),
            title: Container(),
            activeIcon: Image.asset("images/home_selected.png", width: 24.0, height: 24.0,),
          ),
          BottomNavigationBarItem(
            icon: Image.asset("images/search_unselected.png", width: 24.0, height: 24.0,),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Image.asset("images/add_unselected.png", width: 24.0, height: 24.0,),
            title: Container(),
            activeIcon: Image.asset("images/add_selected.png", width: 24.0, height: 24.0,),
          ),
          BottomNavigationBarItem(
            icon: Image.asset("images/heart_unselected.png", width: 24.0, height: 24.0,),
            title: Container(),
            activeIcon: Image.asset("images/heart_selected.png", width: 24.0, height: 24.0,),
          ),
          BottomNavigationBarItem(
            icon: Image.asset("images/profile_unselected.png", width: 24.0, height: 24.0,),
            title: Container(),
            activeIcon: Image.asset("images/profile_selected.png", width: 24.0, height: 24.0,),
          ),
        ],
      ),*/
        );
  }

  Widget getAppBar() {
    return AppBar(
      title: Container(
        margin: EdgeInsets.only(top: 4.0),
        child: Image.asset(
          "images/logo_instagram.png",
          height: 24.0,
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(14.0),
        child: getIcon("images/camera.png"),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: getIcon(
            "images/igtv_logo.png",
            width: 30.0,
            height: 30.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: getIcon(
            "images/send_icon.png",
          ),
        ),
      ],
      backgroundColor: Colors.white,
    );
  }

  Widget getIcon(String unSelectedImage,
      {double width = 24.0,
      double height = 24.0,
      String selectedImage = "",
      bool isSelected = false}) {
    return Image.asset(
      isSelected ? selectedImage : unSelectedImage,
      width: width,
      height: height,
    );
  }

  void _handleTabSelection() {
    setState(() {
      int index = tabController.index;
      switch (index) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
        case 3:
          break;
        default:
          break;
      }
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
