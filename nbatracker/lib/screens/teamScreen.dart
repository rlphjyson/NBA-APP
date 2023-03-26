import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nbatracker/models/teams_model.dart';
import 'package:nbatracker/values/colors.dart';
import 'package:nbatracker/widgets/playerCard.dart';

import '../bloc/player_bloc/player_bloc.dart';
import '../bloc/player_bloc/player_state.dart';
import '../bloc/team_bloc/team_bloc.dart';
import '../bloc/team_bloc/team_state.dart';
import '../models/players_model.dart';
import '../widgets/teamCard.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  List<NbaTeamsModel> teamsResult = [];
  late TeamsBloc _teamsBloc;
  @override
  void initState() {
    super.initState();
    _teamsBloc = BlocProvider.of<TeamsBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TeamsBloc, TeamsState>(
      listener: (context, state) {
        if (state is TeamsLoadingState) {
          print("loading: $state");
        } else if (state is TeamsErrorState) {
          //can add dialog box here to show error message
          print("error: $state");
        } else if (state is TeamsLoadedState) {
          print(state);
        }
      },
      builder: (context, state) {
        if (state is TeamsLoadingState) {
          print("loading: $state");
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TeamsErrorState) {
          print("error: $state");
        } else if (state is TeamsLoadedState) {
          List<NbaTeamsModel> teamsList = state.nbaTeams;

          return ListView.builder(
              itemCount: teamsList.length,
              itemBuilder: (context, index) {
                var players = teamsList[index];
                return TeamCard(
                    id: teamsList[index].id!,
                    city: teamsList[index].city!,
                    conferece: teamsList[index].conference!,
                    teamName: teamsList[index].fullName!,
                    division: teamsList[index].division!);
              });
        } else {
          return Container();
        }
        return Container();
      },
    );
  }
}
