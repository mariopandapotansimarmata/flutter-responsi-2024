import 'package:flutter/material.dart';
import 'package:responsi_if_2024/league_model.dart';
import 'package:responsi_if_2024/page3.dart';

import 'source.dart';
import 'team_model.dart';

class DetailPage extends StatefulWidget {
  final String? id;
  const DetailPage({
    super.key,
    required this.id,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Page")),
      body: SafeArea(
          child: FutureBuilder(
        future: League(widget.id.toString()).loadTeams(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            // debugPrint(snapshot.data);
            return Text("error");
          }
          if (snapshot.hasData) {
            TeamModel team = TeamModel.fromJson(snapshot.data);
            return BuildListTeam(
              data: team,
            );
          }
          return Text("Loading");
        },
      )),
    );
  }
}

class BuildListTeam extends StatefulWidget {
  final TeamModel data;
  const BuildListTeam({super.key, required this.data});

  @override
  State<BuildListTeam> createState() => _BuildListTeamState();
}

class _BuildListTeamState extends State<BuildListTeam> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: widget.data?.data?.length,
      itemBuilder: (context, int index) {
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailTeams(team:widget.data?.data![index]);
            },));
          },
          child: Card(
            color: Colors.blue,
            margin: EdgeInsets.all(14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.2,
                    "${widget.data?.data?[index].logoClubUrl}"),
                Text(
                  "${widget.data?.data?[index].nameClub}",  style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
                ),

                Text(
                  "${widget.data?.data?[index].headCoach}",
                  style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 14,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
