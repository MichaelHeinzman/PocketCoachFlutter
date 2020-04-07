import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pocket_coach/common_widgets/user_post_container.dart';
import 'package:pocket_coach/services/auth.dart';
import 'package:pocket_coach/services/database.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  get color => null;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: <Widget>[
        _buildChildren(),
      ],
    ));
  }

  // BottomHalf: Consists of badges, friends and posts.
  Widget _buildChildren() {
    // Widget To hold Scrolling Feature: ListView.
    // Once We have a way to know how many posts
    // there are, we can use ListView.Builder.
    return Container(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: _buildHeader() +
                _buildBadgesContainer() +
                _buildExperienceContainer() +
                _buildFriendsContainer() +
                _buildPostContainer(),
          ),
        ));
  }

  List<Widget> _buildExperienceContainer() {
    return [
      Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Container(
          // Constraints
          height: 50,
          alignment: Alignment.center,

          // Decoration
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),

          // Swipe widget
          // Calls badges Details to place into Container Widget.
        ),
      )
    ];
  }

  // Creates structure to hold badges.
  List<Widget> _buildBadgesContainer() {
    return [
      Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Container(
          // Constraints
          height: 50,
          alignment: Alignment.center,

          // Decoration
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),

          // Swipe widget
          // Calls badges Details to place into Container Widget.
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: _buildIndividualBadges() + _buildIndividualBadges(),
          ),
        ),
      )
    ];
  }

  // Creates individual badges
  List<Widget> _buildIndividualBadges() {
    return [
      FlatButton(
        onPressed: () {},
        child: Image.asset('assets/images/Badges.png'),
      )
    ];
  }

  // Creates space to hold friends
  List<Widget> _buildFriendsContainer() {
    return [
      Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Container(
          height: 100,
          alignment: Alignment.center,

          // Decoration/Design
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),

          // Swipe Function
          // Individual Friend profile.
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: _buildIndividualFriends() + _buildIndividualFriends(),
          ),
        ),
      )
    ];
  }

  // Creates individual Friends.
  List<Widget> _buildIndividualFriends() {
    return [
      FlatButton(
        onPressed: () {},
        child: Image.asset('assets/images/Bitmoji.png'),
      )
    ];
  }

  // Holds Structure for Posts.
  List<Widget> _buildPostContainer() {
    return [
      Padding(padding: EdgeInsets.only(bottom: 10), child: UserPostContainer()),
    ];
  }

  List<Widget> _buildHeader() {
    int points = 72;
    return [
      Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Container(
              alignment: Alignment.center,

              // Design/Decoration
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),

              // Layout For header: Stack is necessary for positioning well.
              child: Stack(
                children: <Widget>[
                  // Profile Picture
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: CircleAvatar(
                      foregroundColor: Colors.black,
                      backgroundImage: AssetImage('assets/images/Bitmoji.png'),
                      radius: 75.0,
                      backgroundColor: Colors.transparent,
                    ),
                  ),

                  //Points
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      '$points',
                      maxLines: points,
                      style: TextStyle(color: Colors.black),
                      textScaleFactor: 5.0,
                    ),
                  ),
                ],
              )))
    ];
  }
}
