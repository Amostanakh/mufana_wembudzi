class GoatModel {
  final String tagNumber;
  final String birthDate;
  final double weight;
  final String gender;
  final int father;
  final int mother;
  final int owner;

  GoatModel({
    required this.tagNumber,
    required this.birthDate,
    required this.weight,
    required this.gender,
    required this.father,
    required this.mother,
    required this.owner,
  });

  factory GoatModel.fromJson(Map<String, dynamic> json) {
    return GoatModel(
      tagNumber: json['tag_number'],
      birthDate: json['birth_date'],
      weight: json['weight'],
      gender: json['gender'],
      father: json['father'],
      mother: json['mother'],
      owner: json['owner'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tag_number': tagNumber,
      'birth_date': birthDate,
      'weight': weight,
      'gender': gender,
      'father': father,
      'mother': mother,
      'owner': owner,
    };
  }
}
