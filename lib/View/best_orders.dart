
import 'package:flutter/material.dart';

class BestOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            child:Padding(padding: EdgeInsets.only(top:60,right: 5,left: 5,bottom: 15),child:Container(child:Center( child:Text('        الصبغه\n يبدا من 50 ريال ',style: TextStyle(color: Colors.pink[500],fontWeight: FontWeight.bold),)),color:Color.fromRGBO(190, 175, 133, 2.8),width: 70,),),
            height: 100,
            width: MediaQuery.of(context).size.width - 300.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  image: AssetImage('assets/1.png',),
                  fit: BoxFit.fill
              ),
            ),
          ),
          Container(
            child:Padding(padding: EdgeInsets.only(top:60,right: 5,left: 5,bottom: 15),child:Container(child:Center( child:Text('      كريم الوجه\n يبدا من 50 ريال ',style: TextStyle(color: Colors.pink[500],fontWeight: FontWeight.bold),)),color:Color.fromRGBO(190, 175, 133, 2.8),width: 70,),),
            height: 100,
            width: MediaQuery.of(context).size.width - 300.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  image: AssetImage('assets/2.png',),
                  fit: BoxFit.fill
              ),
            ),
          ),
          Container(
            child:Padding(padding: EdgeInsets.only(top:60,right: 5,left: 5,bottom: 15),child:Container(child:Center( child:Text('        الصبغه\n يبدا من 50 ريال ',style: TextStyle(color: Colors.pink[500],fontWeight: FontWeight.bold),)),color:Color.fromRGBO(190, 175, 133, 2.8),width: 70,),),
            height: 100,
            width: MediaQuery.of(context).size.width - 300.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  image: AssetImage('assets/3.png',),
                  fit: BoxFit.fill
              ),
            ),
          ),
          Container(
            child:Padding(padding: EdgeInsets.only(top:60,right: 5,left: 5,bottom: 15),child:Container(child:Center( child:Text('        الليزر\n يبدا من 50 ريال ',style: TextStyle(color: Colors.pink[500],fontWeight: FontWeight.bold),)),color:Color.fromRGBO(190, 175, 133, 2.8),width: 70,),),
            height: 100,
            width: MediaQuery.of(context).size.width - 300.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  image: AssetImage('assets/4.png',),
                  fit: BoxFit.fill
              ),
            ),
          ),
          Container(
            child:Padding(padding: EdgeInsets.only(top:60,right: 5,left: 5,bottom: 15),child:Container(child:Center( child:Text('       الاسنان\n يبدا من 50 ريال ',style: TextStyle(color: Colors.pink[500],fontWeight: FontWeight.bold),)),color:Color.fromRGBO(190, 175, 133, 2.8),width: 70,),),
            height: 100,
            width: MediaQuery.of(context).size.width - 300.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  image: AssetImage('assets/6.png',),
                  fit: BoxFit.fill
              ),
            ),
          ),
        ],
      ),
    );
  }
}

