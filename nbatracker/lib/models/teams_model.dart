class NbaTeamsModel {
  int? id;
  String? abbreviation;
  String? city;
  String? conference;
  String? division;
  String? fullName;
  String? name;

  NbaTeamsModel(
      {this.id,
      this.abbreviation,
      this.city,
      this.conference,
      this.division,
      this.fullName,
      this.name});

  NbaTeamsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    abbreviation = json['abbreviation'];
    city = json['city'];
    conference = json['conference'];
    division = json['division'];
    fullName = json['full_name'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['abbreviation'] = abbreviation;
    data['city'] = city;
    data['conference'] = conference;
    data['division'] = division;
    data['full_name'] = fullName;
    data['name'] = name;
    return data;
  }
}
