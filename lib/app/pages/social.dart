import 'package:flutter/material.dart';
import 'package:pocket_coach/common_widgets/user_post_container.dart';

class Social extends StatefulWidget {
  @override
  _SocialState createState() => _SocialState();
}

class _SocialState extends State<Social> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: _buildChildren(),
        padding: EdgeInsets.all(5),
      ),
    );
  }

  List<Widget> _buildChildren() {
    return [
      new Padding(
        padding: EdgeInsets.all(5),
        child: new UserPostContainer(),
      ),
      new Padding(
        padding: EdgeInsets.all(5),
        child: new UserPostContainer(),
      ),
      new Padding(
        padding: EdgeInsets.all(5),
        child: new UserPostContainer(),
      ),
      new Padding(
        padding: EdgeInsets.all(5),
        child: new UserPostContainer(),
      ),
      new Padding(
        padding: EdgeInsets.all(5),
        child: new UserPostContainer(),
      ),
      new Padding(
        padding: EdgeInsets.all(5),
        child: new UserPostContainer(),
      ),
      new Padding(
        padding: EdgeInsets.all(5),
        child: new UserPostContainer(),
      ),
    ];
  }
}
