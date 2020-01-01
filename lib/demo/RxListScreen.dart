import 'package:flutter/material.dart';
import 'package:web_portfolio/business_logic/rxListBloc.dart';

class RxListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RxListScreen();
  }
}

class _RxListScreen extends State<RxListScreen> {
  final formStateKey = GlobalKey<FormState>();
  final bloc = RxListBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rx List"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: StreamBuilder(
                stream: bloc.messageStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.length > 0) {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Icon(Icons.description),
                            title: Text(snapshot.data[index]),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                bloc.deleteMessage(index);
                              },
                            ),
                          );
                        },
                      );
                    } else {
                      return getEmptyView();
                    }
                  } else {
                    return getEmptyView();
                  }
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              height: 55.0,
              child: Form(
                key: formStateKey,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        onSaved: (value) {
                          bloc.message = value;
                        },
                        onFieldSubmitted: (value) {
                          setState(() {
                            if (formStateKey.currentState.validate()) {
                              bloc.message = value;
                              bloc.addMessage();
                              formStateKey.currentState.reset();
                            }
                          });
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please enter note";
                          }
                        },
                      ),
                    ),
                    Container(
                      width: 100.0,
                      height: 50.0,
                      child: FlatButton.icon(
                        onPressed: () {
                          setState(() {
                            if (formStateKey.currentState.validate()) {
                              formStateKey.currentState.save();
                              bloc.addMessage();
                              formStateKey.currentState.reset();
                            }
                          });
                        },
                        icon: Icon(Icons.send),
                        label: Text("Add"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      /*bottomNavigationBar: Container(
        margin: EdgeInsets.all(10.0),
        height: 50.0,
        child: Form(
          key: formStateKey,
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  onSaved: (value) {
                    bloc.message = value;
                  },
                  onFieldSubmitted: (value) {
                    setState(() {
                      bloc.message = value;
                      bloc.addMessage();
                      formStateKey.currentState.reset();
                    });
                  },
                ),
              ),
              Container(
                width: 100.0,
                height: 50.0,
                child: FlatButton.icon(
                  onPressed: () {
                    setState(() {
                      formStateKey.currentState.save();
                      bloc.addMessage();
                      formStateKey.currentState.reset();
                    });
                  },
                  icon: Icon(Icons.send),
                  label: Text("Send"),
                ),
              ),
            ],
          ),
        ),
      ),*/
    );
  }

  Widget getEmptyView() {
    return Center(
      child: Image.asset(
        "images/empty_note.png",
        width: 200.0,
        height: 200.0,
      ),
    );
  }
}
