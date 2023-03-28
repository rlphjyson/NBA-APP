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

String filterValue = 'All Teams';

class TeamScreen extends StatefulWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  List<NbaTeamsModel> filteredListOfTeams = [];
  List<NbaTeamsModel> teamsResult = [];
  List<NbaTeamsModel> teamsList = [];
  List<NbaTeamsModel> filteredTeamsList = [];
  late TeamsBloc _teamsBloc;

  @override
  void initState() {
    _teamsBloc = BlocProvider.of<TeamsBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final filterList = [
      'All Teams',
      'Atlantic Division',
      'Central Division',
      'Southeast Division',
      'Northwest Division',
      'Pacific Division',
      'Southwest Division',
      'Eastern Conference',
      'Western Conference'
    ];
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
          teamsList = state.nbaTeams;

          filterTeams() async {
            filteredListOfTeams = [];
            for (var i = 0; i < teamsList.length; i++) {
              switch (filterValue) {
                case 'All Teams':
                  {
                    filteredListOfTeams = teamsList;
                    break;
                  }
                case 'Atlantic Division':
                  {
                    if (teamsList[i].division == 'Atlantic') {
                      filteredListOfTeams.add(teamsList[i]);
                    }
                    break;
                  }
                case 'Central Division':
                  {
                    if (teamsList[i].division == 'Central') {
                      filteredListOfTeams.add(teamsList[i]);
                    }
                    break;
                  }
                case 'Southeast Division':
                  {
                    if (teamsList[i].division == 'Southeast') {
                      filteredListOfTeams.add(teamsList[i]);
                    }
                    break;
                  }
                case 'Northwest Division':
                  {
                    if (teamsList[i].division == 'Northwest') {
                      filteredListOfTeams.add(teamsList[i]);
                    }
                    break;
                  }
                case 'Pacific Division':
                  {
                    if (teamsList[i].division == 'Pacific') {
                      filteredListOfTeams.add(teamsList[i]);
                    }
                    break;
                  }
                case 'Southwest Division':
                  {
                    if (teamsList[i].division == 'Southwest') {
                      filteredListOfTeams.add(teamsList[i]);
                    }
                    break;
                  }
                case 'Eastern Conference':
                  {
                    if (teamsList[i].conference == 'East') {
                      filteredListOfTeams.add(teamsList[i]);
                    }
                    break;
                  }
                case 'Western Conference':
                  {
                    if (teamsList[i].conference == 'West') {
                      filteredListOfTeams.add(teamsList[i]);
                    }
                    break;
                  }
              }
            }
            setState(() {
              filteredTeamsList = filteredListOfTeams;
            });
          }

          filterTeams();
          return Column(
            children: [
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButton<String>(
                  underline: SizedBox(),
                  isExpanded: true,
                  value: filterValue,
                  icon: const Icon(Icons.filter_list_rounded),
                  onChanged: (String? value) {
                    setState(() {
                      filterValue = value!;
                    });
                    filterTeams();
                  },
                  items: filterList
                      .map((String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: filteredTeamsList.length,
                    itemBuilder: (context, index) {
                      var teams = filteredTeamsList[index];
                      return TeamCard(
                          id: teams.id!,
                          city: teams.city!,
                          conferece: teams.conference!,
                          teamName: teams.fullName!,
                          division: teams.division!);
                    }),
              ),
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
