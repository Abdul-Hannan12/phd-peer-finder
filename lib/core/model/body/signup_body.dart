// ignore_for_file: unnecessary_this

import 'dart:io';

class SignUpBody {
  String? email;
  String? password;
  String? name;
  String? location;
  String? gender;
  String? phone;
  File? image;

  SignUpBody({
    this.email,
    this.password,
    this.gender,
    this.location,
    this.name,
    this.phone,
    this.image,
    // this.fcmToken,
  });

  toJson() async {
    return {
      'email': this.email,
      'password': this.password,
      'name': this.name,
      'location': this.location,
      'gender': this.gender,
      'phone': this.phone,
    };
  }
}
