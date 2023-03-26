import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nbatracker/bloc/player_bloc/player_event.dart';
import 'package:nbatracker/bloc/player_bloc/player_bloc.dart';
import 'package:nbatracker/pages/home_page.dart';
import 'package:nbatracker/values/colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PlayersBloc()..add(LoadPlayersEvent()),
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
