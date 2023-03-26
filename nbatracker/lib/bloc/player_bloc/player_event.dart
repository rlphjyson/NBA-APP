import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class PlayersEvent extends Equatable {
  const PlayersEvent();

  @override
  List<Object> get props => [];
}

class LoadPlayersEvent extends PlayersEvent {
  @override
  List<Object> get props => [];
}
