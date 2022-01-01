import 'package:flutter/material.dart';

class Famous extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage("assets/11.png"),
            radius:45 ,
            backgroundColor: Colors.white,
          ),
          SizedBox(width: 20,),
          CircleAvatar(
            backgroundImage: AssetImage("assets/13.png"),
            radius:45 ,
            backgroundColor: Colors.white,
          ),
          SizedBox(width: 20,),
          CircleAvatar(
            backgroundImage: AssetImage("assets/14.png"),
            radius:45 ,
            backgroundColor: Colors.white,
          ),
          SizedBox(width: 20,),
          CircleAvatar(
            backgroundImage: AssetImage("assets/15.png"),
            radius:45 ,
            backgroundColor: Colors.white,
          ),
          SizedBox(width: 20,),
          CircleAvatar(
            backgroundImage: AssetImage("assets/16.png"),
            radius:45 ,
            backgroundColor: Colors.white,
          ),
          SizedBox(width: 20,),
          CircleAvatar(
            backgroundImage: AssetImage("assets/40.png"),
            radius:45 ,
            backgroundColor: Colors.white,
          ),
          SizedBox(width: 20,),
          CircleAvatar(
            backgroundImage: AssetImage("assets/39.png"),
            radius:45 ,
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}



