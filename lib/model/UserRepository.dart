import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'User.dart';

/// Repository (i.e. Model) that provides access to a Firestore
///    database.  Change actions will notify listeners via the associated provider.
class UserRepository extends ChangeNotifier {
  var db;

  /* Initialize the firestore database and remember that db value */
  UserRepository() {
    db = FirebaseFirestore.instance;
  }

  /// Reads all users from the database and returns a list of User.
  ///   Return value is a future:  Future<List<User>>
  Future<List<User>> getAllUsers() async {
    var results = await db.collection("users").get();
    List<User> users = [];
    for (var doc in results.docs) {
      var user = User.fromJson(doc.data());
      users.add(user);
    }

    return users;
  }

  void addFixedUser() {
    addUser(username: "alove", first: "Ada", last: "Lovelace", image: null);
  }

  /// Create a new user with the given username (which will be unique)
  ///    and the given first name (required), last name and image url.
  void addUser({required String username, required String first,
    String? last, String? image}) async {
    // First check to see if the username already exists
    var existing = await db.collection("users").doc(username);
    if (existing == null) {
      final user = User(username: username,
          first: first,
          last: last,
          image: image);

      // Add a new document with a generated ID
      db.collection("users").doc(username).set(user.toJson());
      notifyListeners();
      print("New user $username added");
    } else {
      print("Duplicate user $username - not added");
    }
  }

  updateFirstNameFixed() {
    updateFirstName(username: "alove", first: "Adada");
  }

  /// Update the user matching the given username with the given first name
  void updateFirstName(
      {required String username, required String first}) async {
    var user = await db.collection("users").doc(username);
    try {
      await user.update({"first": first});
      print("user $username successfully updated");
      notifyListeners();
    } catch (e) {
      print("Error updating user $username: $e");
    }
  }

void deleteFixedUser() {
  deleteUser(username: "alove");
}

/// Delete the user that matches the given username
void deleteUser({required String username}) async {
  await db.collection("users")
      .doc(username)
      .delete();
  notifyListeners();
}}