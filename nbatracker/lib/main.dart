import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nbatracker/bloc/player_bloc/player_event.dart';
import 'package:nbatracker/bloc/player_bloc/player_bloc.dart';
import 'package:nbatracker/pages/home_page.dart';
import 'package:nbatracker/values/colors.dart';

import 'bloc/team_bloc/team_bloc.dart';
import 'bloc/team_bloc/team_event.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PlayersBloc()..add(LoadPlayersEvent()),
        ),
        BlocProvider(
          create: (context) => TeamsBloc()..add(LoadTeamsEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'NBA TRACKER',
        theme: ThemeData(
            fontFamily: 'DMSans',
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(primary: CustomColor.primaryColor)),

        home: HomePage(),
        // routes: {
        //   '/login': (context) => const LoginPage(),
        //   '/register': (context) => const RegisterPage(),
        //   '/home': (context) => const HomePage(),
        // },
      ),
    );
  }
}
