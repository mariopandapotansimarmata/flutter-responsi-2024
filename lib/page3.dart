import 'package:flutter/material.dart';
import 'package:responsi_if_2024/team_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailTeams extends StatefulWidget {
  final Data? team;
  const DetailTeams({super.key, required this.team});

  @override
  State<DetailTeams> createState() => _DetailTeamsState();
}

class _DetailTeamsState extends State<DetailTeams> {
  bool isLike = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Team"),
        actions: [
          Container(
              padding: EdgeInsets.only(right: 20),
              child: IconButton(
                icon: isLike
                    ? Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : Icon(Icons.favorite_border_outlined),
                onPressed: () {
                  String text = "";
                  setState(() {
                    isLike = !isLike;
                    if (isLike == true) {
                      text = "Favorite team added";
                    } else {
                      text = "Favorite team  removed";
                    }
                  });
                  SnackBar snackbar = SnackBar(
                    content: Text(text),
                    backgroundColor: isLike ? Colors.green : Colors.red,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                },
              ))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                child: Image.network(widget.team!.logoClubUrl.toString())),
            Text(
              widget.team!.nameClub.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            DataCard(
                title: "Head Coach", value: widget.team!.headCoach.toString()),
            DataCard(
                title: "Captain", value: widget.team!.captainName.toString()),
            DataCard(
                title: "Stadium Name",
                value: widget.team!.stadiumName.toString()),
            Text("Logo Url",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20)),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                _launchUrl(widget.team!.logoClubUrl.toString());
              },
              child: Icon(Icons.launch),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String mealUrl) async {
    Uri url = Uri.parse(mealUrl);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}

class DataCard extends StatelessWidget {
  final String title;
  final String value;
  const DataCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title,
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20)),
        Text(value),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
