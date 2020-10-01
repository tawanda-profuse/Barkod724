import 'package:cloud_firestore/cloud_firestore.dart'; // added myself

class User {
  final String uid;

  User({this.uid});
}

class UserData {
  final String uid;
  final String name;
  final String cardNum;
  final int cardLimits;
  final int availableCredits;

  UserData(
      {this.uid,
      this.name,
      this.cardNum,
      this.cardLimits,
      this.availableCredits});
}

class UserServices {
  Firestore _firestore = Firestore.instance;
  String collection = "users";

  void createUser(Map data) {
    _firestore.collection(collection).document(data["userId"]).setData(data);
  }
}
