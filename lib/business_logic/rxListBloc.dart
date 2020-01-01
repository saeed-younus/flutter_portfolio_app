import 'package:rxdart/rxdart.dart';

class RxListBloc extends Object {
  String message = "";
  List<String> _message = [];

  Stream<List<String>> get messageStream => messageSubject.stream;
  final messageSubject = BehaviorSubject<List<String>>();

  void addMessage() {
    _message.add(message);
    messageSubject.add(_message);
  }

  void deleteMessage(int index) {
    _message.removeAt(index);
    messageSubject.add(_message);
  }
}
