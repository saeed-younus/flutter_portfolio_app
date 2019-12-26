import 'package:flutter/material.dart';

class Status extends StatefulWidget {
  @override
  State createState() {
    return _Status();
  }
}

class _Status extends State<Status> {
  List<StatusBaseModel> chats = [];

  final int secondaryColor = 0xFF25d366;

  _Status() {
    for (int i = 0; i < 25; i++) {
      if (i == 0) {
        StatusModel model = StatusModel(StatusBaseModel.ADD_TYPE,
            "images/profile.jpg", "My Status", "Tap to add status update", 0);
        chats.add(model);
      } else if (i == 1) {
        StatusHeaderModel model =
            StatusHeaderModel(StatusBaseModel.HEADER_TYPE, "Recent Updates");
        chats.add(model);
      } else if (i < 5) {
        StatusModel model = StatusModel(
            StatusBaseModel.DATA_TYPE,
            "images/profile.jpg",
            "Muhammad Saeed Younus",
            "Today, 7:40 PM",
            13 * i);
        chats.add(model);
      } else if (i == 5) {
        StatusHeaderModel model =
            StatusHeaderModel(StatusBaseModel.HEADER_TYPE, "Muted Updates");
        chats.add(model);
      } else {
        StatusModel model = StatusModel(
            StatusBaseModel.MUTE_TYPE,
            "images/profile.jpg",
            "Muhammad Saeed Younus",
            "Today, 7:40 PM",
            13 * i);
        chats.add(model);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return getChatItem(chats[index]);
      },
      itemCount: chats.length,
    );
  }

  Widget getChatItem(StatusBaseModel chat) {
//    Image image = Image(image: assetImage);
    switch (chat.type) {
      case StatusBaseModel.ADD_TYPE:
        return getAddItem(chat);
        break;
      case StatusBaseModel.HEADER_TYPE:
        return getHeaderItem(chat);
        break;
      case StatusBaseModel.DATA_TYPE:
        return getDataItem(chat);
        break;
      case StatusBaseModel.MUTE_TYPE:
        return getMuteItem(chat);
        break;
      default:
        return getHeaderItem(chat);
        break;
    }
  }

  Widget getAddItem(StatusModel model) {
    AssetImage assetImage = AssetImage(model.image);
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: assetImage,
        backgroundColor: Colors.blue,
        radius: 25.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Color(secondaryColor),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Icon(
                    Icons.add,
                    size: 16.0,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      title: Text(
        model.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
      ),
      subtitle: Text(model.description),
    );
  }

  Widget getDataItem(StatusModel model) {
    AssetImage assetImage = AssetImage(model.image);
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFF34b7f1),
              width: 2.0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        padding: EdgeInsets.all(1.0),
        child: CircleAvatar(
          backgroundImage: assetImage,
          backgroundColor: Colors.blue,
          radius: 25.0,
        ),
      ),
      title: Text(
        model.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
      ),
      subtitle: Text(model.description),
    );
  }

  Widget getMuteItem(StatusModel model) {
    AssetImage assetImage = AssetImage(model.image);
    return Opacity(
      opacity: 0.5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: assetImage,
          backgroundColor: Colors.blue,
          radius: 25.0,
        ),
        title: Text(
          model.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
        ),
        subtitle: Text(model.description),
      ),
    );
  }

  Widget getHeaderItem(StatusHeaderModel model) {
    return Container(
      padding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16.0),
      decoration: BoxDecoration(color: Color(0xFFefefef)),
      child: Text(
        model.title,
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          color: Colors.black45,
        ),
      ),
    );
  }
}

class StatusBaseModel {
  int type;

  static const int ADD_TYPE = 0;
  static const int HEADER_TYPE = 1;
  static const int DATA_TYPE = 2;
  static const int MUTE_TYPE = 3;

  StatusBaseModel(this.type);
}

class StatusModel extends StatusBaseModel {
  String image;
  String title;
  String description;
  int statusCount;

  StatusModel(type, this.image, this.title, this.description, this.statusCount)
      : super(type);
}

class StatusHeaderModel extends StatusBaseModel {
  String title;

  StatusHeaderModel(type, this.title) : super(type);
}
