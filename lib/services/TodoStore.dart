library todo.services.TodoStore;

import 'package:angular2/src/facade/collection.dart' show ListWrapper;

class KeyModel {
  num _key;
  KeyModel(num key) {
    this._key = key;
  }
}
class Todo extends KeyModel {
  String title;
  bool completed;
  Todo(num key, String theTitle, bool isCompleted) : super(key) {
    this.title = theTitle;
    this.completed = isCompleted;
  }
}
class TodoFactory {
  num _uid;
  TodoFactory() {
    this._uid = 0;
  }
  nextUid() {
    this._uid = this._uid + 1;
    return this._uid;
  }
  create(String title, bool isCompleted) {
    return new Todo(this.nextUid(), title, isCompleted);
  }
}
class Store {
  List<KeyModel> list;
  Store() {
    this.list = [];
  }
  add(KeyModel record) {
    this.list.add(record);
  }
  remove(KeyModel record) {
    this.spliceOut(record);
  }
  removeBy(Function callback) {
    var records = ListWrapper.filter(this.list, callback);
    ListWrapper.removeAll(this.list, records);
  }
  spliceOut(KeyModel record) {
    var i = this.indexFor(record);
    if (i > -1) {
      return this.list.removeAt(i);
    }
    return null;
  }
  indexFor(KeyModel record) {
    return this.list.indexOf(record);
  }
}
