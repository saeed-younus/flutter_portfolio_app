import 'package:flutter/material.dart';

class Calls extends StatefulWidget {
  @override
  State createState() {
    return _Calls();
  }
}

class _Calls extends State<Calls> {
  List<CallModel> chats = [];
  final int whatsAppAppBarColor = 0xFF128c7e;
  final int secondaryColor = 0xFF25d366;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 25; i++) {
      if ((i + 1) % 4 == 0) {
        CallModel model = CallModel("images/profile.jpg",
            "Muhammad Saeed Younus", "Yesturday 12:31 PM", false, false);
        chats.add(model);
      } else if ((i + 1) % 3 == 0) {
        CallModel model = CallModel("images/profile1.jpg",
            "Muhammad Saeed Younus", "November 5, 5:31 PM", true, false);
        chats.add(model);
      } else if (i % 2 == 0) {
        CallModel model = CallModel("images/profile1.jpg",
            "Muhammad Saeed Younus", "November 1, 1:31 PM", false, true);
        chats.add(model);
      } else {
        CallModel model = CallModel("images/profile.jpg",
            "Muhammad Saeed Younus", "Yesturday 12:31 PM", true, true);
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

  Widget getChatItem(CallModel chat) {
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
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              chat.isGoing ? Icons.call_made : Icons.call_received,
              color: chat.isReceived ? Color(secondaryColor) : Colors.red,
              size: 20.0,
            ),
            SizedBox.fromSize(
              size: Size(10.0, 10.0),
            ),
            Text(chat.time),
          ],
        ),
      ),
      trailing: IconButton(
          icon: Icon(
            Icons.call,
            color: Color(whatsAppAppBarColor),
          ),
          onPressed: () {}),
    );
  }
}

class CallModel {
  String image;
  String title;
  String time;
  bool isGoing;
  bool isReceived;

  CallModel(this.image, this.title, this.time, this.isGoing, this.isReceived);
}
