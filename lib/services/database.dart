import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Barkod724/models/barcode.dart';
import 'package:Barkod724/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference barcodeCollection =
      Firestore.instance.collection('barcodes');

  Future updateUserData(
      String cardNum, String name, int availableCredits, int cardLimits) async {
    return await barcodeCollection.document(uid).setData(
      {
        'cardnumber': cardNum,
        'name': name,
        'availablecredits': availableCredits,
        'cardlimit': cardLimits,
      },
    );
  }

  //Get list from snapshot
  List<Barcode> _barcodeListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Barcode(
        name: doc.data['name'] ?? '',
        cardNum: doc.data['cardNumber'] ?? '',
        availableCredits: doc.data['availableCredits'] ?? 0,
        cardLimits: doc.data['cardLimits'] ?? 0,
      );
    }).toList();
  }

  // userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      cardNum: snapshot.data['cardNumber'],
      availableCredits: snapshot.data['availableCredits'],
      cardLimits: snapshot.data['cardLimits'],
    );
  }

  //get barcodes stream
  Stream<List<Barcode>> get barcodes {
    return barcodeCollection.snapshots().map(_barcodeListFromSnapshot);
  }

  // get user document strem
  Stream<UserData> get userData {
    return barcodeCollection
        .document(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }
}
