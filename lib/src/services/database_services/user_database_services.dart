import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluchat/src/models/user_model.dart';

class UserDatabase {
  String db = "users";

  Future<void> addUser(UserModel user) async {
    try {
      CollectionReference collection =
          FirebaseFirestore.instance.collection(db);
      collection.add(user.toJson());
    } catch (e) {
      log("$e");
    }
  }
}
