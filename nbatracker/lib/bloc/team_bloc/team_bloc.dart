import 'package:bloc/bloc.dart';
import '../../repositories/repository.dart';
import 'team_event.dart';
import 'team_state.dart';

class TeamsBloc extends Bloc<TeamsEvent, TeamsState> {
  TeamsBloc() : super(TeamsLoadingState()) {
    final TeamsRepository nbaTeamsRepository = TeamsRepository();
    on<LoadTeamsEvent>((event, emit) async {
      emit(TeamsLoadingState());
      try {
        final nbaTeams = await nbaTeamsRepository.getTeams();
        emit(TeamsLoadedState(nbaTeams));
      } catch (e) {
        emit(TeamsErrorState(e.toString()));
      }
    });
  }
}
