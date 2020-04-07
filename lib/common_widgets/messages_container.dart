import 'package:flutter/material.dart';

class MessagesContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState()=> _MessagesContainerState();
  }
  
  class _MessagesContainerState extends State<MessagesContainer> {
    _MessagesContainerState
    ({
    this.borderRadius: 20.0,
    this.height: 100.0,
    this.message: "Hey Guys I just love posting things",
  }) : assert(borderRadius != null);
  final double borderRadius;
  final double height;
  final String message;
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

  List<Widget> _buildChildren(){
    return [
          ListTile(
            // Where the Post will go
            title:Text(
              message,
              style: TextStyle(color: textColor,)
            ),
            // Where the additional goes: Comment, Like, Share, etc.
            )
    ];
  }
}