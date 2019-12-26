import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  @override
  State createState() {
    return _Chats();
  }
}

class _Chats extends State<Chats> {
  List<ChatModel> chats = [];

  final int secondaryColor = 0xFF25d366;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 25; i++) {
      if ((i + 1) % 4 == 0) {
        ChatModel model = ChatModel("images/profile.jpg",
            "Muhammad Saeed Younus", "Hmmm", "12:31 PM", false, 13 * i);
        chats.add(model);
      } else if ((i + 1) % 3 == 0) {
        ChatModel model = ChatModel("images/profile1.jpg",
            "Muhammad Saeed Younus", "Hmmm", "12:31 PM", true, 0);
        chats.add(model);
      } else if (i % 2 == 0) {
        ChatModel model = ChatModel("images/profile.jpg",
            "Muhammad Saeed Younus", "Hmmm", "12:31 PM", false, 0);
        chats.add(model);
      } else {
        ChatModel model = ChatModel("images/profile1.jpg",
            "Muhammad Saeed Younus", "Hmmm", "12:31 PM", true, i * 23);
        chats.add(model);
      }
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        return getChatItem(chats[index]);
      },
      itemCount: chats.length,
    );
  }

  Widget getChatItem(ChatModel chat) {
    AssetImage assetImage = AssetImage(chat.image);
//    Image image = Image(image: assetImage);
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: assetImage,
        backgroundColor: Colors.blue,
        radius: 25.0,
      ),
      title: Text(
        chat.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
      ),
      subtitle: Text(chat.description),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 30,
            child: Text(
              chat.time,
              style: TextStyle(
                  fontSize: 12.0,
                  color: chat.unreadCounts > 0
                      ? Color(secondaryColor)
                      : Colors.black87),
            ),
          ),
          Container(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: chat.isSilent ? Icon(Icons.volume_off) : SizedBox(),
                ),
                chat.unreadCounts > 0
                    ? Container(
                        decoration: BoxDecoration(
                          color: Color(secondaryColor),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        padding: EdgeInsets.only(
                          left: 5.0,
                          top: 2.0,
                          right: 5.0,
                          bottom: 2.0,
                        ),
                        child: Text(
                          chat.unreadCounts.toString(),
                          style: TextStyle(fontSize: 12.0, color: Colors.white),
                        ),
                      )
                    : SizedBox(
                        width: 10,
                        height: 10,
                      ),
              ],
            ),
          ),
          // FlatButton.icon(
          //   onPressed: null,
          //   icon: Opacity(
          //       opacity: chat.isSilent ? 1.0 : 0.0,
          //       child: Icon(Icons.volume_off)),
          //   label: Opacity(
          //     opacity: chat.unreadCounts > 0 ? 1.0 : 0.0,
          //     child: Container(
          //       decoration: BoxDecoration(
          //           color: Color(secondaryColor),
          //           borderRadius: BorderRadius.all(Radius.circular(10.0))),
          //       padding: EdgeInsets.only(
          //           left: 5.0, top: 2.0, right: 5.0, bottom: 2.0),
          //       child: Text(
          //         chat.unreadCounts.toString(),
          //         style: TextStyle(fontSize: 12.0, color: Colors.white),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class ChatModel {
  String image;
  String title;
  String description;
  String time;
  bool isSilent;
  int unreadCounts;

  ChatModel(this.image, this.title, this.description, this.time, this.isSilent,
      this.unreadCounts);
}
