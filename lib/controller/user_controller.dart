import 'package:apple/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/web.dart';

class UserController {
  Future<void> saveUserData(UserModel user) async {
    try {
      CollectionReference userCollection =
          FirebaseFirestore.instance.collection('Users');

      await userCollection.doc(user.uid).set(user.toJson()).then(
        (value) {
          Logger().e('Data Saved');
        },
      );
    } catch (e) {
      Logger().e(e);
    }
  }
}
