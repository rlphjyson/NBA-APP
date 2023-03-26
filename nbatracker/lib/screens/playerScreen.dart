import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nbatracker/models/teams_model.dart';
import 'package:nbatracker/values/colors.dart';
import 'package:nbatracker/widgets/playerCard.dart';

import '../bloc/player_bloc/player_bloc.dart';
import '../bloc/player_bloc/player_state.dart';
import '../models/players_model.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  List<NbaPlayersModel> playersResult = [];
  late PlayersBloc _playersBloc;
  @override
  void initState() {
    super.initState();
    _playersBloc = BlocProvider.of<PlayersBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayersBloc, PlayersState>(
      listener: (context, state) {
        if (state is PlayersLoadingState) {
          print("loading: $state");
        } else if (state is PlayersErrorState) {
          //can add dialog box here to show error message
          print("error: $state");
        } else if (state is PlayersLoadedState) {
          print(state);
        }
      },
      builder: (context, state) {
        if (state is PlayersLoadingState) {
          print("loading: $state");
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PlayersErrorState) {
          print("error: $state");
        } else if (state is PlayersLoadedState) {
          List<NbaPlayersModel> playersList = state.nbaPlayers;

          return Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: playersList.length,
                    itemBuilder: (context, index) {
                      var players = playersList[index];
                      return PlayerCard(
                          firstName: playersList[index].firstName!,
                          lastName: playersList[index].lastName!,
                          position: playersList[index].position!,
                          teamName: playersList[index].team!.fullName!);
                    }),
              )
            ],
          );
        } else {
          return Container();
        }
        return Container();
      },
    );
  }
}
