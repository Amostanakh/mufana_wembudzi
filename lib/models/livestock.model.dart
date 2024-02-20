class LivestockModel {
  String? phoneNumber;
  String? uid;
  String? tagNo;
  String? dateOfBirth;
  String? dateOfEntryOnFarm;
  String? mothersTag;

  LivestockModel(
      {this.phoneNumber,
      this.uid,
      this.tagNo,
      this.dateOfBirth,
      this.dateOfEntryOnFarm,
      this.mothersTag});

  LivestockModel.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['email'];
    uid = json['uid'];
    tagNo = json['tagNo'];
    dateOfBirth = json['dateOfBirth'];
    dateOfEntryOnFarm = json['dateOfEntryOnFarm'];
    mothersTag = json['mothersTag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = phoneNumber;
    data['uid'] = uid;
    data['tagNo'] = tagNo;
    data['dateOfBirth'] = dateOfBirth;
    data['dateOfEntryOnFarm'] = dateOfEntryOnFarm;
    data['mothersTag'] = mothersTag;
    return data;
  }
}
