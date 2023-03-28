import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nbatracker/models/teams_model.dart';
import 'package:nbatracker/values/colors.dart';
import 'package:nbatracker/widgets/playerCard.dart';
import 'package:nbatracker/widgets/searchbar.dart';

import '../bloc/player_bloc/player_bloc.dart';
import '../bloc/player_bloc/player_state.dart';
import '../models/players_model.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  String query = '';
  List<NbaPlayersModel> searchList = [];
  List<NbaPlayersModel> playersList = [];
  List<NbaPlayersModel> searchedList = [];
  late PlayersBloc _playersBloc;

  @override
  void initState() {
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
          playersList = state.nbaPlayers;

          return Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SearchWidget(
                  text: query,
                  hintText: 'Search Player',
                  onChanged: searchPlayer),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: searchList.length,
                    itemBuilder: (context, index) {
                      var player = searchList[index];
                      return PlayerCard(
                          firstName: player.firstName!,
                          lastName: player.lastName!,
                          position: player.position!,
                          teamName: player.team!.fullName!);
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

  void searchPlayer(String query) async {
    final searchLower = query.toLowerCase();
    searchedList = [];
    for (var i = 0; i < playersList.length; i++) {
      if (playersList[i].firstName!.toLowerCase().contains(searchLower) ||
          playersList[i].lastName!.toLowerCase().contains(searchLower) ||
          ('${playersList[i].firstName!.toLowerCase()} ${playersList[i].lastName!.toLowerCase()}')
              .contains(searchLower)) {
        searchedList.add(playersList[i]);
      }
    }

    setState(() {
      searchList = searchedList;
    });
  }
}
