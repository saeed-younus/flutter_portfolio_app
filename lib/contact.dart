import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:js' as js;

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen>
    with SingleTickerProviderStateMixin {
  double _opacity = 0;
  Alignment _alignment = Alignment(0, 0.2);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _opacity = 1;
        _alignment = Alignment(0, 0);
      });
    });
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Text(
            "Contact",
            style: TextStyle(
              fontFamily: "Comfortaa",
              fontSize: Theme.of(context).textTheme.display2.fontSize,
              fontWeight: Theme.of(context).textTheme.display2.fontWeight,
            ),
          ),
          Text(
            "\nYou can contact me everywhere you wanted! I am active on all platform.",
            style: TextStyle(
              fontFamily: "Comfortaa",
              fontSize: Theme.of(context).textTheme.headline.fontSize,
              fontWeight: Theme.of(context).textTheme.headline.fontWeight,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                getContactItem("images/instagram.png", "Instagram", () {
                  js.context.callMethod("open",
                      ["https://www.instagram.com/muhammad_saeed_younus/"]);
                }),
                getContactItem("images/facebook.png", "Facebook", () {
                  js.context.callMethod("open",
                      ["https://www.facebook.com/saeed.younus.attari/"]);
                }),
                getContactItem("images/twitter.png", "Twitter", () {
                  js.context.callMethod(
                      "open", ["https://twitter.com/Muhamma61725608/"]);
                }),
                getContactItem("images/github.png", "Github", () {
                  js.context
                      .callMethod("open", ["https://github.com/saeed-younus"]);
                }),
                getContactItem("images/medium.png", "Medium", () {
                  js.context
                      .callMethod("open", ["https://medium.com/@sendtosaeed2"]);
                }),
                getContactItem("images/skype.png", "Skype", () {
                  js.context.callMethod(
                      "open", ["https://join.skype.com/invite/mUnZReqK9kcQ"]);
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getContactItem(String assetName, String title, VoidCallback onTap) {
    return SizedBox(
      height: 100,
      width: 100,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 64,
              height: 64,
              child: Image.asset(assetName),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontFamily: "Comfortaa",
                fontSize: Theme.of(context).textTheme.body1.fontSize,
                fontWeight: Theme.of(context).textTheme.body1.fontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
