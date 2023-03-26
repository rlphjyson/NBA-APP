import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class TeamsState extends Equatable {}

class TeamsLoadingState extends TeamsState {
  @override
  List<Object?> get props => [];
}

class TeamsLoadedState<NbaTeamsModel> extends TeamsState {
  final NbaTeamsModel nbaTeams;

  TeamsLoadedState(this.nbaTeams);

  @override
  List<Object?> get props => [nbaTeams];
}

class TeamsErrorState extends TeamsState {
  final String error;

  TeamsErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
