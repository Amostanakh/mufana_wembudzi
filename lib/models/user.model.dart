class UserModel {
  String? email;
  String? uid;
  String? username;
  String? userPhoneNumber;
  String? homeAddress;

  UserModel(
      {this.email,
      this.uid,
      this.username,
      this.userPhoneNumber,
      this.homeAddress});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    uid = json['uid'];
    username = json['username'];
    userPhoneNumber = json['userPhoneNumber'];
    homeAddress = json['homeAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['uid'] = uid;
    data['username'] = username;
    data['userPhoneNumber'] = userPhoneNumber;
    data['homeAddress'] = homeAddress;

    return data;
  }
}
