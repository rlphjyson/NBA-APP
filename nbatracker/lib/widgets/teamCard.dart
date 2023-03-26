import 'package:flutter/material.dart';

class TeamCard extends StatefulWidget {
  final int id;
  final String city;
  final String conferece;
  final String teamName;
  final String division;
  const TeamCard(
      {Key? key,
      required this.id,
      required this.city,
      required this.conferece,
      required this.teamName,
      required this.division})
      : super(key: key);

  @override
  State<TeamCard> createState() => _TeamCardState();
}

class _TeamCardState extends State<TeamCard> {
  String teamLogo = '';
  @override
  void initState() {
    super.initState();
    switch (widget.id) {
      case 1:
        setState(() {
          teamLogo = 'atlanta-hawks';
        });
        break;
      case 2:
        setState(() {
          teamLogo = 'boston-celtics';
        });
        break;
      case 3:
        setState(() {
          teamLogo = 'brooklyn-nets';
        });
        break;
      case 4:
        setState(() {
          teamLogo = 'charlotte-hornets';
        });
        break;
      case 5:
        setState(() {
          teamLogo = 'chicago-bulls';
        });
        break;
      case 6:
        setState(() {
          teamLogo = 'cleveland-cavaliers';
        });
        break;
      case 7:
        setState(() {
          teamLogo = 'dallas-mavericks';
        });
        break;
      case 8:
        setState(() {
          teamLogo = 'denver-nuggets';
        });
        break;
      case 9:
        setState(() {
          teamLogo = 'detroit-pistons';
        });
        break;
      case 10:
        setState(() {
          teamLogo = 'golden-state-warriors';
        });
        break;
      case 11:
        setState(() {
          teamLogo = 'houston-rockets';
        });
        break;
      case 12:
        setState(() {
          teamLogo = 'indiana-pacers';
        });
        break;
      case 13:
        setState(() {
          teamLogo = 'la-clippers';
        });
        break;
      case 14:
        setState(() {
          teamLogo = 'los-angeles-lakers';
        });
        break;
      case 15:
        setState(() {
          teamLogo = 'memphis-grizzlies';
        });
        break;
      case 16:
        setState(() {
          teamLogo = 'miami-heat';
        });
        break;
      case 17:
        setState(() {
          teamLogo = 'milwaukee-bucks';
        });
        break;
      case 18:
        setState(() {
          teamLogo = 'minnesota-timberwolves';
        });
        break;
      case 19:
        setState(() {
          teamLogo = 'new-orleans-pelicans';
        });
        break;
      case 20:
        setState(() {
          teamLogo = 'new-york-knicks';
        });
        break;
      case 21:
        setState(() {
          teamLogo = 'oklahoma-city-thunder';
        });
        break;
      case 22:
        setState(() {
          teamLogo = 'orlando-magic';
        });
        break;
      case 23:
        setState(() {
          teamLogo = 'philadelphia-76ers';
        });
        break;
      case 24:
        setState(() {
          teamLogo = 'phoenix-suns';
        });
        break;
      case 25:
        setState(() {
          teamLogo = 'portland-trail-blazers';
        });
        break;
      case 26:
        setState(() {
          teamLogo = 'sacramento-kings';
        });
        break;
      case 27:
        setState(() {
          teamLogo = 'san-antonio-spurs';
        });
        break;
      case 28:
        setState(() {
          teamLogo = 'toronto-raptors';
        });
        break;
      case 29:
        setState(() {
          teamLogo = 'utah-jazz';
        });
        break;
      case 30:
        setState(() {
          teamLogo = 'washington-wizards';
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.375,
          width: MediaQuery.of(context).size.width * 0.65,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 209, 209, 209),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/images/nbalogos/nba-$teamLogo-logo.png'),
                    radius: 70,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Name: ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(widget.teamName,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'City: ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(widget.city,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Conference: ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(widget.conferece,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Division: ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(widget.division,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
