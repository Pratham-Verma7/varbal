import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:someone_datingapp/data/repositories/authentication_repo/authentication_repository.dart';
import 'package:someone_datingapp/features/personalization/model/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<UserModel> fetchUserDataWithUsername(String username) async {
    // fetch user record
    try {
      final querySnapshot = await _db
          .collection('Users')
          .where('username', isEqualTo: username)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        return UserModel.fromSnapshot(querySnapshot.docs.first);
      } else {
        return UserModel.empty();
      }
    } catch (e) {
      throw 'error : $e';
    }
  }

  Future<bool> userNameCheck(String username) async {
    try {
      final querySnapshot = await _db
          .collection('Users')
          .where('username', isEqualTo: username)
          .get();
      return querySnapshot.docs.isEmpty;
    } catch (e) {
      throw 'Error querying username: $e';
    }
  }

  Future<void> saveUserRecord(UserModel user) async {
    // save user record
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } catch (e) {
      throw 'Data not Saved';
    }
  }

  Future<UserModel> fetchUserDetails() async {
    // get user record
    try {
      final documentSnapshot = await _db
          .collection('Users')
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } catch (e) {
      throw 'error : $e';
    }
  }

  Future<void> updateUserDetails(UserModel updatedUser) async {
    // update user record
    try {
      await _db
          .collection('Users')
          .doc(updatedUser.id)
          .update(updatedUser.toJson());
    } catch (e) {
      throw 'error : $e';
    }
  }

  Future<void> updateSingleUserField(Map<String, dynamic> json) async {
    // update single user field
    try {
      await _db
          .collection('Users')
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
    } catch (e) {
      throw 'error : $e';
    }
  }

  Future<void> deleteUserRecord() async {
    // delete user record
    try {
      await _db
          .collection('Users')
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .delete();
    } catch (e) {
      throw 'error : $e';
    }
  }

  Future<String> uploadImage(String path, XFile image) async {
    // upload image
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      throw 'error : $e';
    }
  }
}
