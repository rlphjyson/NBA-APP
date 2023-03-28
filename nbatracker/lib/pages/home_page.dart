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

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<NbaPlayersModel> playersResult = [];
  late PlayersBloc _playersBloc;
  late TabController _tabController;
  bool tabIsLeft = false;
  @override
  void initState() {
    _playersBloc = BlocProvider.of<PlayersBloc>(context);
    _tabController = TabController(length: 2, vsync: this);
    tabIsLeft = true;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  changeTab() {
    if (_tabController.index == 0) {
      setState(() {
        tabIsLeft = true;
      });
    } else {
      setState(() {
        tabIsLeft = false;
      });
    }
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
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Column(
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: !tabIsLeft ? Colors.grey[300] : Colors.white,
                borderRadius: BorderRadius.circular(
                  15.0,
                ),
              ),
              child: TabBar(
                onTap: (index) {
                  changeTab();
                },
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: tabIsLeft
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15))
                      : const BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                  color: CustomColor.primaryColor,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  Tab(
                    text: 'Players',
                  ),
                  Tab(
                    text: 'Teams',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: const [
                  PlayerScreen(),
                  TeamScreen(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
