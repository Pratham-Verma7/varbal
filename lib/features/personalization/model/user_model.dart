import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  String email;
  String username;
  String fullName;
  int likes;
  String bio;
  String bgImg;
  String profileUrl;
  String gender;
  String phoneNo;
  String dob;

  UserModel({
    required this.likes,
    required this.bio,
    required this.id,
    required this.email,
    required this.username,
    required this.fullName,
    required this.bgImg,
    required this.profileUrl,
    required this.gender,
    required this.phoneNo,
    required this.dob,
  });

  // String get formattedPhoneNumber => SFormatter.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(name) {
    return name.split(' ');
  }

  static UserModel empty() => UserModel(
        id: '',
        email: '',
        username: '',
        fullName: '',
        bgImg: '',
        profileUrl: '',
        bio: '',
        gender: '',
        likes: 0,
        phoneNo: '',
        dob: '',
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'fullName': fullName,
      'bgImg': bgImg,
      'profileUrl': profileUrl,
      'bio': bio,
      'likes': likes,
      'gender': gender,
      'phoneNo': phoneNo,
      'dob': dob,
    };
  }

  static UserModel fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        email: data['email'] ?? '',
        username: data['username'] ?? '',
        fullName: data['fullName'] ?? '',
        bgImg: data['bgImg'] ?? '',
        profileUrl: data['profileUrl'] ?? '',
        bio: data['bio'] ?? '',
        likes: data['likes'] ?? 0,
        gender: data['gender'] ?? '',
        phoneNo: data['phoneNo'] ?? '',
        dob: data['dob'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}
