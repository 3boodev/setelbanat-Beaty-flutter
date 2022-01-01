import 'package:flutter/material.dart';
import '../main.dart';
import 'auth/login.dart';
import 'home.dart';
import 'about.dart';
import 'best_sal_orders.dart';
import 'catogry.dart';
import 'salon.dart';
import '../shared/component/app_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
class Callus extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Set Elbanat',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // List all of the app's supported locales here
        supportedLocales: [
          Locale('en', 'US'),
          Locale('ar', 'EG'),
        ],
        // These delegates make sure that the localization data for the proper language is loaded
        localizationsDelegates: [
          // THIS CLASS WILL BE ADDED LATER
          // A class which loads the translations from JSON files
          AppLocalizations.delegate,
          // Built-in localization of basic text for Material widgets
          GlobalMaterialLocalizations.delegate,
          // Built-in localization for text direction LTR/RTL
          GlobalWidgetsLocalizations.delegate,
        ],
        // Returns a locale which will be used by the app
        localeResolutionCallback: (locale, supportedLocales) {
          // Check if the current device locale is supported
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          // If the locale of the device is not supported, use the first one
          // from the list (English, in this case).
          return supportedLocales.first;
        },
        home: Callus_Page(),
        routes: <String,WidgetBuilder>{
          "/main":(BuildContext context)=>MyApp(),
          "/login":(BuildContext context)=>Login(),
        }
    );
  }
}
class Callus_Page extends StatefulWidget {
  @override
  CallusState createState() {
    return new CallusState();
  }
}

class CallusState extends State<Callus_Page> with SingleTickerProviderStateMixin  {
  Animation<double> animation;
  AnimationController controller;
  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = new Tween(begin: 0.0, end: 18.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller.forward();
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      appBar: AppBar
        (
        backgroundColor: Colors.white,
        leading: Text(''),
        actions: <Widget>[
          Padding(padding: EdgeInsets.only(right:100,),child:IconButton(icon: Icon(Icons.search,color: Colors.black54,), onPressed: null) ,),
          Padding(padding: EdgeInsets.only(right:100,),child:  Image.asset("assets/hpic.png"),),
          Padding(padding: EdgeInsets.only(right:10,),child: IconButton(icon: new Icon(Icons.menu,color: Colors.black54,), onPressed: () => scaffoldKey.currentState.openEndDrawer()))
        ],
      ),
      body:Container(
          height: 700.0,
          child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 3,left: 310),child:  Text(AppLocalizations.of(context).translate('m_call'),style: TextStyle(fontSize:22,fontWeight: FontWeight.bold,color: Colors.black54,fontFamily: "mobily"),)),
                SizedBox(height: 30,),
                Center(child: Center(child: Text(AppLocalizations.of(context).translate('join'),style: TextStyle(fontSize:18,color: Colors.purple,fontFamily: "mobily",fontWeight: FontWeight.bold),),), ),
                SizedBox(height: 20,),
                Center(child: Center(child: Text('     نحن نؤمن بتحدى الوضع الراهن هو كل شيئ نعمله ، نؤمن \n     بالتفكير خارج الصندوق لتغيير الوضع الراهن هو يجعل تصميم\n    تطبيقنا يتألق حمالا وسهل الاستخدام وتصورى ان هذا التطبيق \n                                    هو التطبيق الأول للجمال'
                  ,style: TextStyle(fontSize:16,color: Colors.black54,fontFamily: "mobily",fontWeight: FontWeight.bold),textDirection: TextDirection.rtl,),), ),
                SizedBox(height: 10,),
                Center(child: Center(child: Text(AppLocalizations.of(context).translate('join_now'),style: TextStyle(fontSize:18,color: Colors.pinkAccent,fontFamily: "mobily",fontWeight: FontWeight.bold),),), ),
                SizedBox(height: 10,),
                Text('______________________________',style: TextStyle(fontSize:18,color: Colors.black54),),
                SizedBox(height: 10,),
                Row(children: <Widget>[
                  Text('          info@beautysn.har',style: TextStyle(fontWeight:FontWeight.bold,fontSize:18,color: Colors.purpleAccent),),
                  SizedBox(width: 20,),
                  Text(AppLocalizations.of(context).translate('contact'),style: TextStyle(fontWeight: FontWeight.bold,fontSize:18,color: Colors.black54,fontFamily: "mobily"),),
                ],),
                Row(children: <Widget>[ Text('          BeautySnhar.com',style: TextStyle(fontWeight:FontWeight.bold,fontSize:18,color: Colors.purpleAccent),),
                  SizedBox(width: 20,),
                  Text(AppLocalizations.of(context).translate('visit'),style: TextStyle(fontWeight: FontWeight.bold,fontSize:18,color: Colors.black54,fontFamily: "mobily"),),],),
                Text('______________________________',style: TextStyle(fontSize:18,color: Colors.black54),),
                SizedBox(height: 20,),
                Row(children: <Widget>[
                  SizedBox(width: 80,),
                  CircleAvatar(backgroundColor:Colors.white ,radius: 30,backgroundImage: AssetImage("assets/google.png"),child: IconButton(iconSize: 80,icon: Image.asset("assets/google.png"),onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder: (_) =>Home()),),)),
                  SizedBox(width: 20,),
                  CircleAvatar(backgroundColor:Colors.white ,radius: 30,backgroundImage: AssetImage("assets/face.png"),child: IconButton(iconSize: 80,icon: Image.asset("assets/face.png"),onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder: (_) =>Home()),),)),
                  SizedBox(width: 20,),
                  CircleAvatar(backgroundColor:Colors.white ,radius: 30,backgroundImage: AssetImage("assets/twitter.png"),child: IconButton(iconSize: 60,icon: Image.asset("assets/twitter.png"),onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder: (_) =>Home()),),)),
                  SizedBox(width: 50,),
                ]),
                SizedBox(height: 20,),
           Row(children: <Widget>[SizedBox(width: 65,), Text(AppLocalizations.of(context).translate('m_sign'),style: TextStyle(fontFamily: "mobily",fontWeight:FontWeight.bold,fontSize:18,color: Colors.pink),),
          SizedBox(width: 10,),
          Text(AppLocalizations.of(context).translate('contact_direct'),style: TextStyle(fontWeight: FontWeight.bold,fontSize:18,color: Colors.black54,fontFamily: "mobily"),),],),


              ])),

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
                title:Center(child:Text(AppLocalizations.of(context).translate('m_home'),style: TextStyle(fontSize:22,fontWeight: FontWeight.bold,color: Colors.purple[500],fontFamily: "mobily"),)),
                onTap:()=>Navigator.push(context,MaterialPageRoute(builder: (_) =>Home()),)),

            ListTile(
                title:Center(child:Text(AppLocalizations.of(context).translate('m_about'),style: TextStyle(fontSize:22,fontWeight: FontWeight.bold,color: Colors.purple[500],fontFamily: "mobily"),),),
                onTap:()=>Navigator.push(context,MaterialPageRoute(builder: (_) =>About()),)),

            ListTile(
                title:Center(child:Text(AppLocalizations.of(context).translate('m_call'),style: TextStyle(fontSize:22,fontWeight: FontWeight.bold,color: Colors.purple[500],fontFamily: "mobily"),),),
                onTap:()=>Navigator.push(context,MaterialPageRoute(builder: (_) =>Callus()),)),

            ListTile(
                title: Center(child:Text(AppLocalizations.of(context).translate('m_sign'),style: TextStyle(fontSize:22,fontWeight: FontWeight.bold,color: Colors.purple[500],fontFamily: "mobily"),),),
                onTap:()=>Navigator.push(context,MaterialPageRoute(builder: (_) =>Login()),) ),
            ListTile(
                title:Center(child:Text(AppLocalizations.of(context).translate('m_cate'),style: TextStyle(fontSize:22,fontWeight: FontWeight.bold,color: Colors.purple[500],fontFamily: "mobily"),),),
                onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (_) =>Catogry()),)),
            ListTile(
                title: Center(child:Text(AppLocalizations.of(context).translate('m_best'),style: TextStyle(fontSize:22,fontWeight: FontWeight.bold,color: Colors.purple[500],fontFamily: "mobily"),),),
                onTap:()=>Navigator.push(context,MaterialPageRoute(builder: (_) =>Best_sal_order()),)),
            ListTile(
              title:Center(child: Text(AppLocalizations.of(context).translate('m_city'),style: TextStyle(fontSize:22,fontWeight: FontWeight.bold,color: Colors.purple[500],fontFamily: "mobily"),),),
              onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (_) =>Salon()),),),
            Image.asset("assets/9.png"),
          ],
        ),
      ),
    );
  }}
