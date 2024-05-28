import 'package:flutter/material.dart';
import 'package:responsi_if_2024/page2.dart';
import 'package:responsi_if_2024/source.dart';
import 'package:responsi_if_2024/team_model.dart';

import 'league_model.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Responsi"),
      ),
      body: SafeArea(
          child: FutureBuilder(
        future: League("").loadLeague(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            // debugPrint(snapshot.data);
            return Text("error");
          }
          if (snapshot.hasData) {
            LeagueModel league = LeagueModel.fromJson(snapshot.data);
            return BuildList(
              data: league,
            );
          }
          return Text("Loading");
        },
      )),
    );
  }
}

class BuildList extends StatefulWidget {
  final LeagueModel data;
  const BuildList({super.key, required this.data});

  @override
  State<BuildList> createState() => _BuildListState();
}

class _BuildListState extends State<BuildList> {
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
              return DetailPage(id:widget.data?.data?[index].idLeague.toString());
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
                    "${widget.data?.data?[index].logoLeagueUrl}"),
                Text(
                  "${widget.data?.data?[index].leagueName}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  "${widget.data?.data?[index].country}",
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

//
// Widget _buildSuccessSection(LeagueModel data) {
//   bool isHover = false ;
//   return Scaffold(
//     body: Stack(
//       children: [
//         GridView.builder(
//           gridDelegate:
//               SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//           itemCount: data.data?.length,
//           itemBuilder: (context, int index) {
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: InkWell(
//                 onHover: (isHover){
//                  setState()
//                 },
//                 child: Card(
//                   // decoration: BoxDecoration(border: Border.all(strokeAlign: 1)),
//                   child: Column(
//                     children: [
//                       SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.25,
//                           width: MediaQuery.of(context).size.width * 0.25,
//                           child: Image.network(
//                               "${data.data?[index].logoLeagueUrl}")),
//                       Text(
//                         "${data.data?[index].leagueName}",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       Text(
//                         "${data.data?[index].country}",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w100, fontSize: 14),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ],
//     ),
//   );
// }
