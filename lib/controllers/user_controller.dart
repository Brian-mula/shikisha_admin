import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shikishaadmin/models/user_model.dart';

class User {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _users =
      FirebaseFirestore.instance.collection("users");

  // !get all users
  Stream<List<UserModel>> get getUserData {
    return _users.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return UserModel.fromSnapshot(doc);
      }).toList();
    });
  }

  // !add a new user
  Future<void> addNewUser(String name, String phone) async {
    try {
      await _users.add({"name": name, "phone": phone});
    } catch (e) {
      print(e.toString());
    }
  }

  // !edit a user
  Future<void> updateUser(String name, String id, String phone) async {
    try {
      await _users.doc(id).update({"name": name, "phone": phone});
    } catch (e) {
      print(e.toString());
    }
  }

  // !delete user
  Future<void> deleteUser(String id) async {
    try {
      await _users.doc(id).delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
