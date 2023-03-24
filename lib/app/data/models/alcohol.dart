class Alcohol {
  String name;
  String alcoholContentPerUnit;

  Alcohol(this.name, this.alcoholContentPerUnit);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'alcoholContentPerUnit': alcoholContentPerUnit,
    };
  }

  factory Alcohol.fromJson(Map<String, dynamic> json) {
    Alcohol alcohol = Alcohol(
        json['name'] as String, json['alcoholContentPerUnit'] as String);
    return alcohol;
  }
}
