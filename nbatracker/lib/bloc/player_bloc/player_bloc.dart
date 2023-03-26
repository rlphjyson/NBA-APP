import 'package:bloc/bloc.dart';
import '../../repositories/repository.dart';
import 'player_event.dart';
import 'player_state.dart';

class PlayersBloc extends Bloc<PlayersEvent, PlayersState> {
  PlayersBloc() : super(PlayersLoadingState()) {
    final PlayersRepository nbaPlayersRepository = PlayersRepository();
    on<LoadPlayersEvent>((event, emit) async {
      emit(PlayersLoadingState());
      try {
        final nbaPlayers = await nbaPlayersRepository.getPlayers();
        emit(PlayersLoadedState(nbaPlayers));
      } catch (e) {
        emit(PlayersErrorState(e.toString()));
      }
    });
  }
}
