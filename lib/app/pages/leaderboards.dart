import 'package:flutter/material.dart';

class Leaderboards extends StatefulWidget {
  @override
  _LeardboardState createState() => _LeardboardState();
}

class _LeardboardState extends State<Leaderboards> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        constraints: BoxConstraints.expand(
          height: 600,
        ),
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20.0),
          crossAxisSpacing: 10.0,
          crossAxisCount: 2,
          children: _buildChildren(),
        ),
      ),
    );
  }

  List<Widget> _buildChildren() {
    return [
      _buildLeaderboardContainer(),
      _buildLeaderboardContainer(),
      _buildLeaderboardContainer(),
      _buildLeaderboardContainer(),
      _buildLeaderboardContainer(),
      _buildLeaderboardContainer(),
    ];
  }

  Widget _buildLeaderboardContainer() {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Container(color: Colors.white, child: Text("jekfjkifj")));
  }
}
