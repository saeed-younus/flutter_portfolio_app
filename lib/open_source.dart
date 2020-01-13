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
                fontFamily: "Roboto",
                fontSize: isDesktop
                    ? Theme.of(context).textTheme.display2.fontSize
                    : Theme.of(context).textTheme.display1.fontSize,
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(minHeight: 250, maxHeight: 250),
            margin: EdgeInsets.all(16),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                OpenSourceCardItem(
                  "Android Library",
                  "Finite Coverflow",
                  "It is an android library which is used to create beautiful snapping animation for your Viewpager2.",
                  Colors.green[900],
                  Color.fromRGBO(230, 255, 230, 1),
                  () {
                    js.context.callMethod("open",
                        ["https://github.com/KoderLabs/finite-cover-flow"]);
                  },
                ),
                OpenSourceCardItem(
                  "Android Library",
                  "Overlay Service",
                  "It is an android library which is used to create custom overlay just like PIP(Picture and picture) and it also have lower than 27 api support.",
                  Colors.green[900],
                  Color.fromRGBO(230, 255, 230, 1),
                  () {
                    js.context.callMethod("open",
                        ["https://github.com/KoderLabs/overlay-service"]);
                  },
                ),
                OpenSourceCardItem(
                  "Android Example Code",
                  "Motion Layout Examples",
                  "In this project you can explore amazing animation which was created in motion layout.",
                  Colors.green[900],
                  Color.fromRGBO(230, 255, 230, 1),
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
                  Colors.blue[900],
                  Color.fromRGBO(220, 245, 255, 1),
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
                  Colors.blue[900],
                  Color.fromRGBO(220, 245, 255, 1),
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

class OpenSourceCardItem extends StatefulWidget {
  String openSourceType;
  String title;
  String description;
  Color titleColor;
  Color cardColor;
  VoidCallback onTap;

  OpenSourceCardItem(
    this.openSourceType,
    this.title,
    this.description,
    this.titleColor,
    this.cardColor,
    this.onTap,
  ) : super();

  @override
  _OpenSourceCardItemState createState() => _OpenSourceCardItemState();
}

class _OpenSourceCardItemState extends State<OpenSourceCardItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: widget.cardColor,
        child: InkWell(
          hoverColor: Colors.white24,
          highlightColor: Colors.white38,
          splashColor: Colors.white54,
          onTap: widget.onTap,
          onHover: (isHover) {
            setState(() {
              this.isHover = isHover;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.openSourceType,
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize:
                              Theme.of(context).textTheme.overline.fontSize,
                          fontWeight: FontWeight.w600,
                          color: widget.titleColor),
                    ),
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: Icon(
                        Icons.open_in_new,
                        color: widget.titleColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 60,
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontFamily: "Roboto",
                      color: widget.titleColor,
                      fontSize: Theme.of(context).textTheme.headline.fontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  widget.description,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: Theme.of(context).textTheme.body1.fontSize,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
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
