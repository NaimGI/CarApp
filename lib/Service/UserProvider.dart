import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../modale/User.dart';

class UserProvider extends ChangeNotifier {
  List<UserData> _users = [];

  List<UserData> get users => _users;

  Future<void> fetchUsers() async {
    try {
      final usersSnapshot =
          await FirebaseFirestore.instance.collection('users').get();
      final List<UserData> loadedUsers = usersSnapshot.docs
          .map((doc) => UserData(
                name: doc['name'] as String,
                email: doc['email'] as String,
                rool: doc['rool'] as String,
              ))
          .toList();

      _users = loadedUsers;

      notifyListeners();
    } catch (error) {
      print('Failed to fetch users: $error');
    }
  }
}
