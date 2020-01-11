import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:js' as js;

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
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
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 50),
          Text(
            "Contact",
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: isDesktop
                  ? Theme.of(context).textTheme.display2.fontSize
                  : Theme.of(context).textTheme.display1.fontSize,
            ),
          ),
          Text(
            "\nYou can contact me everywhere you wanted! I am active on all platform.",
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: isDesktop
                  ? Theme.of(context).textTheme.headline.fontSize
                  : Theme.of(context).textTheme.title.fontSize,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 50,
              children: <Widget>[
                ContactItem(
                  "images/instagram.png",
                  "Instagram",
                  () {
                    js.context.callMethod("open",
                        ["https://www.instagram.com/muhammad_saeed_younus/"]);
                  },
                ),
                ContactItem(
                  "images/facebook.png",
                  "Facebook",
                  () {
                    js.context.callMethod("open",
                        ["https://www.facebook.com/saeed.younus.attari/"]);
                  },
                ),
                ContactItem(
                  "images/twitter.png",
                  "Twitter",
                  () {
                    js.context.callMethod(
                        "open", ["https://twitter.com/Muhamma61725608/"]);
                  },
                ),
                ContactItem(
                  "images/github.png",
                  "Github",
                  () {
                    js.context.callMethod(
                        "open", ["https://github.com/saeed-younus"]);
                  },
                ),
                ContactItem(
                  "images/medium.png",
                  "Medium",
                  () {
                    js.context.callMethod(
                        "open", ["https://medium.com/@sendtosaeed2"]);
                  },
                ),
                ContactItem(
                  "images/skype.png",
                  "Skype",
                  () {
                    js.context.callMethod(
                        "open", ["https://join.skype.com/invite/mUnZReqK9kcQ"]);
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

class ContactItem extends StatelessWidget {
  String assetName;
  String title;
  VoidCallback onTap;

  ContactItem(
    this.assetName,
    this.title,
    this.onTap,
  ) : super();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: InkWell(
        onTap: onTap,
        hoverColor: Colors.black12,
        highlightColor: Colors.black38,
        splashColor: Colors.black54,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 64,
              height: 64,
              child: Image.asset(assetName),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: Theme.of(context).textTheme.body1.fontSize,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
