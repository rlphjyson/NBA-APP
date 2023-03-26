import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class TeamsEvent extends Equatable {
  const TeamsEvent();

  @override
  List<Object> get props => [];
}

class LoadTeamsEvent extends TeamsEvent {
  @override
  List<Object> get props => [];
}
