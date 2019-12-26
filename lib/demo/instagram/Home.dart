import 'package:flutter/material.dart';

class HomeInstagram extends StatefulWidget {
  @override
  State createState() {
    return _HomeInstagram();
  }
}

class _HomeInstagram extends State<HomeInstagram> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          if (index == 0) {
            return getStoryList();
          } else {
            return getComment(index);
          }
        },
      ),
    );
    /*ListView.builder(
      itemBuilder: (context, index) {
        if (index == 0) {
          return getStoryList();
        } else {
          return Image.asset("images/profile.jpg",);
        }
      },
      itemCount: 10,
    );*/
  }

  Widget getStoryList() {
    return Container(
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              width: 80.0,
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  getAddProfileImage(28.0),
                  Text(
                    "Your Story",
                    style: TextStyle(fontSize: 12.0),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          } else {
            return Container(
              width: 82.0,
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  getProfileImage(28.0),
                  Text(
                    "Profile Name",
                    style: TextStyle(fontSize: 12.0),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget getProfileImage(double radius) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.red,
              width: 2.0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(radius * 2)),
          ),
          padding: EdgeInsets.all(1.0),
          child: CircleAvatar(
            radius: radius,
            backgroundImage: AssetImage("images/profile.jpg"),
          ),
        ),
      ],
    );
  }

  Widget getAddProfileImage(double radius) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.transparent,
              width: 2.0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(radius * 2)),
          ),
          padding: EdgeInsets.all(1.0),
          child: CircleAvatar(
            radius: radius,
            backgroundImage: AssetImage("images/profile.jpg"),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.add_circle,
                        size: 20.0,
                        color: Colors.blue,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget getComment(int index) {
    var a = 1;
    if (index % 2 == 0) {
      a = 4;
    }
    return Column(
      children: <Widget>[
        getPartialPostTop(),
        getPartialImageItems(length: a),
        getPartialActionBar(),
        getDescriptionBar(),
      ],
    );
  }

  Widget getPartialPostTop() {
    return Container(
      height: 60.0,
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Container(
            height: 50.0,
            width: 50.0,
            margin: EdgeInsets.only(right: 10.0),
            child: getProfileImage(19.0),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Post Title",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  "Post Description",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 50.0,
            height: 50.0,
            child: Icon(
              Icons.more_vert,
              color: Colors.black45,
            ),
          ),
        ],
      ),
    );
  }

  Widget getPartialImageItems({int length = 1}) {
    if (length == 1) {
      return Image.asset("images/profile1.jpg");
    } else {
      var controller = PageController(initialPage: 0);
      return Container(
          height: 350.0,
          width: double.infinity,
          child: PageView(
            controller: controller,
            children: <Widget>[
              Image.asset(
                "images/profile1.jpg",
                fit: BoxFit.cover,
              ),
              Image.asset(
                "images/profile.jpg",
                fit: BoxFit.cover,
              ),
              Image.asset(
                "images/profile1.jpg",
                fit: BoxFit.cover,
              ),
            ],
          ));
    }
  }

  Widget getPartialActionBar() {
    return Container(
      height: 60.0,
      child: Row(
        children: <Widget>[
          Container(
            height: 44.0,
            width: 44.0,
            child: Icon(Icons
                    .thumb_up) /*Image.asset(
              "images/heart_unselected.jpg",
            )*/
                ,
          ),
          Container(
            height: 44.0,
            width: 44.0,
            child: Icon(Icons
                    .comment) /*Image.asset(
              "images/comment.jpg",
            )*/
                ,
          ),
          Container(
            height: 44.0,
            width: 44.0,
            child: Icon(Icons
                    .send) /*Image.asset(
              "images/send_icon.jpg",
            )*/
                ,
          ),
          Expanded(child: Container()),
          Container(
            height: 44.0,
            width: 44.0,
            child: Icon(Icons
                    .file_download) /*Image.asset(
              "images/download_unselected.jpg",
            )*/
                ,
          ),
        ],
      ),
    );
  }

  Widget getDescriptionBar() {
    return Container(
      padding: EdgeInsets.only(left: 8.0, right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
            child: Text(
              "7 likes",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
            child: Row(
              children: <Widget>[
                Text(
                  "Profile Name",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(4.0),
                ),
                Expanded(
                  child: Text(
                    "Description abcd.....",
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                getProfileImage(15.0),
                Container(
                  margin: EdgeInsets.all(4.0),
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Add a comment...",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.0, bottom: 10.0),
            child: Text(
              "3 HOURS AGO",
              style: TextStyle(
                fontSize: 10.0,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
