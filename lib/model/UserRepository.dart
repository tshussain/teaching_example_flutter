import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'User.dart';

class UserRepository {
  var db;

  /** Initialize the firestore database and remember that db value */
  UserRepository.initialize() {
    db = FirebaseFirestore.instance;
  }

  Future<List<User>> readData() async {
    var results = await db.collection("user").get();
    List<User> users = [];
    for (var doc in results.data!.docs) {
      Map<String, dynamic> userMap = jsonDecode(doc);
      var user = User.fromJson(userMap);
      users.add(user);
    }

    return users;
  }

  void writeData() {
    // Create a new user with a first and last name
    final user = User(id: "1",
        username: "alove",
        first: 'Ada',
        last: 'Lovelace',
        image: 'https://media.sciencephoto.com/image/h4120208/800wm/H4120208-Lady_Ada_Lovelace.jpg');

    // Add a new document with a generated ID
    db.collection("users").add(user.toJson()).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }

}
