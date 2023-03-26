import 'package:nbatracker/models/teams_model.dart';

class NbaPlayersModel {
  int? id;
  String? firstName;
  int? heightFeet;
  int? heightInches;
  String? lastName;
  String? position;
  NbaTeamsModel? team;
  int? weightPounds;

  NbaPlayersModel(
      {this.id,
      this.firstName,
      this.heightFeet,
      this.heightInches,
      this.lastName,
      this.position,
      this.team,
      this.weightPounds});

  NbaPlayersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    heightFeet = json['height_feet'];
    heightInches = json['height_inches'];
    lastName = json['last_name'];
    position = json['position'];
    team = json['team'] != null ? NbaTeamsModel?.fromJson(json['team']) : null;
    weightPounds = json['weight_pounds'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['height_feet'] = heightFeet;
    data['height_inches'] = heightInches;
    data['last_name'] = lastName;
    data['position'] = position;
    if (team != null) {
      data['team'] = team!.toJson();
    }
    data['weight_pounds'] = weightPounds;
    return data;
  }
}
