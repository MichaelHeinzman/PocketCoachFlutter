import 'package:flutter/material.dart';
import 'package:pocket_coach/services/auth.dart';
import 'package:pocket_coach/services/database.dart';
import 'package:provider/provider.dart';

class UserPostContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserPostContainerState();
}

class _UserPostContainerState extends State<UserPostContainer> {
  _UserPostContainerState({
    this.borderRadius: 20.0,
    this.height: 100.0,
    this.post: "Hey Guys I just love posting things",
    this.liked: false,
  }) : assert(borderRadius != null);
  final double borderRadius;
  final double height;
  final String post;
  bool liked;
  final textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Container(
        child: Stack(
          children: _buildChildren(),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }

  _likedPressed() {
    setState(() {
      liked = !liked;
      Database db = Database();
    });
  }

  List<Widget> _buildChildren() {
    return [
      ListTile(
        // Where the Post will go
        title: Text(post,
            style: TextStyle(
              color: textColor,
            )),
        // Where the additional goes: Comment, Like, Share, etc.
        subtitle: Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.all(12.0),
          child: Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    liked ? Icons.favorite : Icons.favorite_border,
                  ),
                  color: textColor,
                  onPressed: () => _likedPressed()),
              InkWell(
                  child: Text(
                    "Comment",
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                  onTap: () {
                    print("hello");
                  }),
            ],
          ),
        ),
      ),
    ];
  }
}
