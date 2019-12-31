import 'package:flutter/material.dart';
import 'dart:js' as js;

class OpenSourceScreen extends StatefulWidget {
  @override
  _OpenSourceScreenState createState() => _OpenSourceScreenState();
}

class _OpenSourceScreenState extends State<OpenSourceScreen> {
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
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Text(
              "Open Source Projects",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Comfortaa",
                fontSize: isDesktop
                    ? Theme.of(context).textTheme.display2.fontSize
                    : Theme.of(context).textTheme.display1.fontSize,
                fontWeight: Theme.of(context).textTheme.display2.fontWeight,
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(minHeight: 250, maxHeight: 300),
            margin: EdgeInsets.all(16),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                OpenSourceCardItem(
                  "Android Library",
                  "Finite Coverflow",
                  "It is an android library which is used to create beautiful snapping animation for your Viewpager2.",
                  Colors.greenAccent,
                  () {
                    js.context.callMethod("open",
                        ["https://github.com/KoderLabs/finite-cover-flow"]);
                  },
                ),
                OpenSourceCardItem(
                  "Android Library",
                  "Overlay Service",
                  "It is an android library which is used to create custom overlay just like PIP(Picture and picture) and it also have lower than 27 api support.",
                  Colors.greenAccent,
                  () {
                    js.context.callMethod("open",
                        ["https://github.com/KoderLabs/overlay-service"]);
                  },
                ),
                OpenSourceCardItem(
                  "Android Example Code",
                  "Motion Layout Examples",
                  "In this project you can explore amazing animation which was created in motion layout.",
                  Colors.greenAccent,
                  () {
                    js.context.callMethod("open", [
                      "https://github.com/saeed-younus/motion-layout-examples"
                    ]);
                  },
                ),
                OpenSourceCardItem(
                  "Flutter Project",
                  "Whats App Ui clone",
                  "In this project I just clone whats app UI in flutter and I explore flutter is so fast, rubust and easy.",
                  Colors.lightBlueAccent,
                  () {
                    js.context.callMethod("open", [
                      "https://github.com/saeed-younus/whatsapp_clone_flutter"
                    ]);
                  },
                ),
                OpenSourceCardItem(
                  "Flutter Project",
                  "My Portfolio Web",
                  "You are running this web it is created in flutter. You can see the code in github.",
                  Colors.lightBlueAccent,
                  () {
                    js.context.callMethod("open", [
                      "https://github.com/saeed-younus/flutter_portfolio_app"
                    ]);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OpenSourceCardItem extends StatelessWidget {
  String openSourceType;
  String title;
  String description;
  Color titleColor;
  VoidCallback onTap;

  OpenSourceCardItem(
    this.openSourceType,
    this.title,
    this.description,
    this.titleColor,
    this.onTap,
  ) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Card(
        elevation: 0,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      openSourceType,
                      style: TextStyle(
                        fontFamily: "Comfortaa",
                        fontSize: Theme.of(context).textTheme.caption.fontSize,
                        fontWeight:
                            Theme.of(context).textTheme.caption.fontWeight,
                      ),
                    ),
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: const Icon(Icons.open_in_new),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 60,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontFamily: "Comfortaa",
                      color: titleColor,
                      fontSize: Theme.of(context).textTheme.headline.fontSize,
                      fontWeight:
                          Theme.of(context).textTheme.headline.fontWeight,
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontFamily: "Comfortaa",
                    fontSize: Theme.of(context).textTheme.body2.fontSize,
                    fontWeight: Theme.of(context).textTheme.body2.fontWeight,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
