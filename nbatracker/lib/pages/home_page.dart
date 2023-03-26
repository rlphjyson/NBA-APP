import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nbatracker/screens/teamScreen.dart';
import 'package:nbatracker/values/colors.dart';

import '../bloc/player_bloc/player_bloc.dart';
import '../models/players_model.dart';
import '../screens/playerScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Scaffold(
      appBar: AppBar(
          backgroundColor: CustomColor.secondaryColor,
          title: Row(
            children: [
              Image.asset(
                'assets/images/nba-logo.png',
                width: 50,
                height: 50,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text('NBA Tracker')
            ],
          )),
      body: const PlayerScreen(),
    );
  }
}
