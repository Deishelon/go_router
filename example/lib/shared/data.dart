import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

/// sample Person class
class Person {
  final String id;
  final String name;
  final int age;
  Person({required this.id, required this.name, required this.age});
}

/// sample Family class
class Family {
  final String id;
  final String name;
  final List<Person> people;
  Family({required this.id, required this.name, required this.people});

  Person person(String pid) => people.singleWhere(
        (p) => p.id == pid,
        orElse: () => throw Exception('unknown person $pid for family $id'),
      );
}

/// sample families data
class Families {
  static final data = [
    Family(
      id: 'f1',
      name: 'Sells',
      people: [
        Person(id: 'p1', name: 'Chris', age: 52),
        Person(id: 'p2', name: 'John', age: 27),
        Person(id: 'p3', name: 'Tom', age: 26),
      ],
    ),
    Family(
      id: 'f2',
      name: 'Addams',
      people: [
        Person(id: 'p1', name: 'Gomez', age: 55),
        Person(id: 'p2', name: 'Morticia', age: 50),
        Person(id: 'p3', name: 'Pugsley', age: 10),
        Person(id: 'p4', name: 'Wednesday', age: 17),
      ],
    ),
    Family(
      id: 'f3',
      name: 'Jackson',
      people: [
        Person(id: 'p1', name: 'Tito', age: 68),
        Person(id: 'p2', name: 'Jermaine', age: 67),
        Person(id: 'p3', name: 'Jackie', age: 70),
        Person(id: 'p4', name: 'Marlon', age: 64),
        Person(id: 'p5', name: 'Michael', age: 63),
      ],
    ),
  ];

  static Family family(String fid) => data.singleWhere(
        (f) => f.id == fid,
        orElse: () => throw Exception('unknown family $fid'),
      );
}

/// info about the current login state that notifies listens upon change
class LoginInfo extends ChangeNotifier with GoRouterLoggedIn {
  var _userName = '';
  String get userName => _userName;

  void login(String userName) {
    _userName = userName;
    notifyListeners();
  }

  void logout() {
    _userName = '';
    notifyListeners();
  }

  // override the GoRouterLoggedIn.loggedIn property
  @override
  bool get loggedIn => _userName.isNotEmpty;
}
