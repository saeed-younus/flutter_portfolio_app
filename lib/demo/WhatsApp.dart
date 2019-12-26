import 'package:flutter/material.dart';
import 'whatsapp/Chats.dart';
import 'whatsapp/Calls.dart';
import 'whatsapp/Status.dart';

class WhatsApp extends StatefulWidget {
  @override
  State createState() {
    return _WhatsApp();
  }
}

class _WhatsApp extends State<WhatsApp> with TickerProviderStateMixin {
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

  static final List<String> chatMenuItems = [
    "New Group",
    "New BroadCast",
    "WhatsApp Web",
    "Starred messages",
    "Settings"
  ];

  static final List<String> statusMenuItems = ["Status Privacy", "Settings"];

  static final List<String> callMenuItems = ["Clear call log", "Settings"];

  Widget fab = FloatingActionButton(
    onPressed: () {},
    backgroundColor: Color(secondaryColor),
    tooltip: "Send Message",
    child: Icon(Icons.message),
  );

  Widget popUpMenuItem = PopupMenuButton(
    child: Icon(Icons.more_vert),
    itemBuilder: (context) {
      return chatMenuItems
          .map((value) => PopupMenuItem(child: Text(value)))
          .toList();
    },
  );

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: 1,
    );
    tabController.addListener(_handleTabSelection);
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      floatingActionButton: fab,
      body: TabBarView(
        children: <Widget>[
          Center(
            child: Text("Camera"),
          ),
          Center(
//            child: Text("Chats"),
            child: Chats(),
          ),
          Center(
//            child: Text("Status"),
            child: Status(),
          ),
          Center(
            child: Calls(),
//            child: Text("Calls"),
          ),
        ],
        controller: tabController,
      ),
    );
  }

  Widget getAppBar() {
    return AppBar(
      title: Text("WhatsApp"),
      automaticallyImplyLeading: false,
      backgroundColor: Color(primaryDarkColor),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.search), onPressed: () {}),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: popUpMenuItem,
        ),
      ],
      bottom: TabBar(
        tabs: [
          Container(
            child: Tab(
              icon: Icon(
                Icons.camera_alt,
              ),
            ),
          ),
          Tab(
            child: Text("CHATS"),
          ),
          Tab(
            child: Text("STATUS"),
          ),
          Tab(
            child: Text("CALLS"),
          ),
        ],
        controller: tabController,
        indicatorColor: Colors.white,
      ),
    );
  }

  void _handleTabSelection() {
    setState(() {
      int index = tabController.index;
      switch (index) {
        case 0:
          setCameraFab();
          break;
        case 1:
          setChatMenuItem();
          setChatFab();
          break;
        case 2:
          setStatusMenuItem();
          setStatusFab();
          break;
        case 3:
          setCallMenuItem();
          setCallFab();
          break;
        default:
          setChatMenuItem();
          setChatFab();
          break;
      }
    });
  }

  void setCameraFab() {
    fadeAnimationController.reset();
    fab = FloatingActionButton(
      onPressed: () {},
      child: FadeTransition(
        opacity: fadeAnimation,
        child: Icon(Icons.camera_enhance),
      ),
      backgroundColor: Color(secondaryColor),
    );
    fadeAnimationController.forward();
  }

  void setChatFab() {
    fadeAnimationController.reset();
    fab = FloatingActionButton(
      onPressed: () {},
      child: FadeTransition(
        opacity: fadeAnimation,
        child: Icon(Icons.message),
      ),
      backgroundColor: Color(secondaryColor),
    );
    fadeAnimationController.forward();
  }

  void setStatusFab() {
    translateAnimationController.reset();
    fadeAnimationController.reset();
    fab = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        AnimatedBuilder(
          animation: translateAnimationController,
          builder: (BuildContext context, Widget child) {
            return Transform(
              transform: Matrix4.translationValues(
                  0.0, (translateAnimation.value * 40), 0.0),
              child: FloatingActionButton(
                onPressed: () {},
                child: FadeTransition(
                  opacity: fadeAnimation,
                  child: Icon(
                    Icons.edit,
                    color: Colors.black45,
                  ),
                ),
                backgroundColor: Color(bgGrayColor),
              ),
            );
          },
        ),
        SizedBox.fromSize(
          size: Size(10.0, 10.0),
        ),
        FloatingActionButton(
          onPressed: () {},
          child: FadeTransition(
            opacity: fadeAnimation,
            child: Icon(Icons.photo_camera),
          ),
          backgroundColor: Color(secondaryColor),
        ),
      ],
    );
    fadeAnimationController.forward();
    translateAnimationController.forward();
  }

  void setCallFab() {
    fadeAnimationController.reset();
    fab = FloatingActionButton(
      onPressed: () {},
      child: FadeTransition(
        opacity: fadeAnimation,
        child: Icon(Icons.call),
      ),
      backgroundColor: Color(secondaryColor),
    );
    fadeAnimationController.forward();
  }

  void setChatMenuItem() {
    popUpMenuItem = PopupMenuButton(
      child: Icon(Icons.more_vert),
      itemBuilder: (context) {
        return chatMenuItems
            .map((value) => PopupMenuItem(child: Text(value)))
            .toList();
      },
    );
  }

  void setStatusMenuItem() {
    popUpMenuItem = PopupMenuButton(
      child: Icon(Icons.more_vert),
      itemBuilder: (context) {
        return statusMenuItems
            .map((value) => PopupMenuItem(child: Text(value)))
            .toList();
      },
    );
  }

  void setCallMenuItem() {
    popUpMenuItem = PopupMenuButton(
      child: Icon(Icons.more_vert),
      itemBuilder: (context) {
        return callMenuItems
            .map((value) => PopupMenuItem(child: Text(value)))
            .toList();
      },
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
