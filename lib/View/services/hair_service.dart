import 'package:flutter/material.dart';
import '../about.dart';
import '../auth/login.dart';
import '../callus.dart';
import '../catogry.dart';
import '../buy_credet.dart';
import '../best_sal_orders.dart';
class Hair_service extends StatelessWidget {
  // This widget is the root of your application.
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Set Elbanat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(length: 1, child: Scaffold(

        appBar: AppBar
          (
          backgroundColor: Colors.white,
          leading: Text(''),
          actions: <Widget>[
            Padding(padding: EdgeInsets.only(right:100,),child:IconButton(icon: Icon(Icons.search,color: Colors.black54,), onPressed: null) ,),
            Padding(padding: EdgeInsets.only(right:100,),child:  Image.asset("assets/hpic.png"),),
            Padding(padding: EdgeInsets.only(right:10,),child: IconButton(icon: new Icon(Icons.menu,color: Colors.black54,), onPressed: () => scaffoldKey.currentState.openEndDrawer()))
          ],
          bottom: TabBar(
              unselectedLabelColor: Colors.white,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.white
              ),
              tabs: [
                Tab(child:Container(width: 150,decoration: BoxDecoration(borderRadius: BorderRadius.circular(2),border: Border.all(color: Colors.white,width: 1)),child: Align(child:  Text('خدمات شعر ',style: TextStyle(color: Colors.black87,fontSize: 18,fontFamily: "mobily",fontWeight: FontWeight.bold)),),)),
              ]),
        ),
        body: TabBarView(children: [
          FutureBuilder(
            future: null,
            builder: (c, snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (BuildContext c, int i) {
                  return ExpansionTile(
                    title: Text(
                      'خدمات شعر',
                      style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(18.0),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'fsdfsa',
                              style: TextStyle(fontSize: 22.0, height: 1.5,color: Colors.white),
                              textAlign: TextAlign.end,
                            ),

                          ],
                        ),
                      )
                    ],
                  );
                },
              )
                  : Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ]),
        endDrawer:new Drawer(
          child: new ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                  padding: const EdgeInsets.only(bottom: 1,),
                  child:
                  Image.asset("assets/8.png"),
                  decoration: new BoxDecoration(
                      color: Colors.white
                  )
              ),
              ListTile(
                title:Center(child:Text('الصفحه الرئيسيه',style: TextStyle(fontSize:22,fontWeight: FontWeight.bold,color: Colors.purple[500],fontFamily: "mobily"),)),
                onTap:()=>Navigator.pop(context),),

              ListTile(
                  title:Center(child:Text('نبذه عنا',style: TextStyle(fontSize:22,fontWeight: FontWeight.bold,color: Colors.purple[500],fontFamily: "mobily"),),),
                  onTap:()=>Navigator.push(context,MaterialPageRoute(builder: (_) =>About()),)),

              ListTile(
                  title:Center(child:Text('اتصلى بنا',style: TextStyle(fontSize:22,fontWeight: FontWeight.bold,color: Colors.purple[500],fontFamily: "mobily"),),),
                  onTap:()=>Navigator.push(context,MaterialPageRoute(builder: (_) =>Callus()),)),

              ListTile(
                  title: Center(child:Text('تسجيل الدخول',style: TextStyle(fontSize:22,fontWeight: FontWeight.bold,color: Colors.purple[500],fontFamily: "mobily"),),),
                  onTap:()=>Navigator.push(context,MaterialPageRoute(builder: (_) =>Login()),) ),
              ListTile(
                  title:Center(child:Text('الاقسام',style: TextStyle(fontSize:22,fontWeight: FontWeight.bold,color: Colors.purple[500],fontFamily: "mobily"),),),
                  onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (_) =>Catogry()),)),
              ListTile(
                  title: Center(child:Text('العروض المميزه',style: TextStyle(fontSize:22,fontWeight: FontWeight.bold,color: Colors.purple[500],fontFamily: "mobily"),),),
                  onTap:()=>Navigator.push(context,MaterialPageRoute(builder: (_) =>Best_sal_order()),)),
              ListTile(
                title:Center(child: Text('تغيير المدينه',style: TextStyle(fontSize:22,fontWeight: FontWeight.bold,color: Colors.purple[500],fontFamily: "mobily"),),),
                onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (_) =>Buy_creadet()),),),

              Image.asset("assets/9.png"),
            ],
          ),
        ),
      ),),
    );
  }
}
