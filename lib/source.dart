import 'base_network.dart';

class League {
  String? id;
  League(this.id);
  // static League instance = League(id);
  Future <Map<String, dynamic>> loadLeague() {
    return BaseNetwork.getLeague("");
  }

  Future <Map<String, dynamic>> loadTeams() {
    return BaseNetwork.getLeague("${id}");
  }
}