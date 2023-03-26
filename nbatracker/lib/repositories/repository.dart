import 'package:nbatracker/models/teams_model.dart';

import '../data/api_provider.dart';
import '../models/players_model.dart';

class TeamsRepository {
  final _provider = ApiProvider();

  Future<List<NbaTeamsModel>> getTeams() async {
    try {
      final List teamsResult = await _provider.teamsRequests();

      return teamsResult.map((e) => NbaTeamsModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception("Failed to load abandoned carts, ${e.toString()}");
    }
  }
}

class PlayersRepository {
  final _provider = ApiProvider();

  Future<List<NbaPlayersModel>> getPlayers() async {
    try {
      final List playersResult = await _provider.playersRequests();

      return playersResult.map((e) => NbaPlayersModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception("Failed to load abandoned carts, ${e.toString()}");
    }
  }
}
