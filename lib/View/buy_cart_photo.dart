import 'package:flutter/material.dart';
class Buy_by_photo extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Set Elbanat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(length: 2, child: Scaffold(

        appBar: AppBar(
          actions: <Widget>[Padding(padding: EdgeInsets.only(right: 160),child: Image.asset('assets/27.png'),),],
          backgroundColor: Colors.white,
        ),
        body:
      Column(children: <Widget>[
       Padding(padding: EdgeInsets.only(top: 140,left: 40,),child: Image.asset('assets/28.png'),),

      ],),
      ),
      )
    );
  }
}
