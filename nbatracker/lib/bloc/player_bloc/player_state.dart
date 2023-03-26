import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class PlayersState extends Equatable {}

class PlayersLoadingState extends PlayersState {
  @override
  List<Object?> get props => [];
}

class PlayersLoadedState<NbaPlayersModel> extends PlayersState {
  final NbaPlayersModel nbaPlayers;

  PlayersLoadedState(this.nbaPlayers);

  @override
  List<Object?> get props => [nbaPlayers];
}

class PlayersErrorState extends PlayersState {
  final String error;

  PlayersErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
