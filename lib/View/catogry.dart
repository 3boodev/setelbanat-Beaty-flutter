import 'package:flutter/material.dart';
import '../main.dart';
import 'about.dart';
import 'auth/login.dart';
import 'callus.dart';
import 'best_sal_orders.dart';
import 'home.dart';
import 'buy_credet.dart';
import '../Controllers/databasehelper.dart';
import '../shared/component/app_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
class Catogry extends StatelessWidget {
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
        home: Catogry_Page(),
        routes: <String,WidgetBuilder>{
          "/main":(BuildContext context)=>MyApp(),
          "/login":(BuildContext context)=>Login(),
        }
    );
  }
}
class Catogry_Page extends StatefulWidget {
  @override
  Catogry_PageState createState() {
    return new Catogry_PageState();
  }
}

class Catogry_PageState extends State<Catogry_Page> with SingleTickerProviderStateMixin  {
  Animation<double> animation;
  AnimationController controller;
  DatabaseHelper _databaseHelper=DatabaseHelper();
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
          Padding(padding: EdgeInsets.only(right:10,),child: IconButton(icon: new Icon(Icons.menu,color: Colors.black54,), onPressed: () => scaffoldKey.currentState.openEndDrawer())),],
      ),
       floatingActionButton: Padding(padding: EdgeInsets.only(bottom: 530,right: 300),child:Text(AppLocalizations.of(context).translate('m_cate'),style: TextStyle(fontSize:22,fontWeight: FontWeight.bold,color: Colors.purple[500],fontFamily: "mobily"),), ),
      body: GridView.count(
            crossAxisCount: 3,
          padding: EdgeInsets.only(top: 120),
          children:[
            Category(
              image_location: "assets/17.png",
              image_name: "",
            ),
            Category(
              image_location: "assets/18.png",
              image_name: "",
            ),
            Category(
              image_location: "assets/19.png",
              image_name: "",
            ),
            Category(
              image_location: "assets/20.png",
              image_name: "",
            ),
            Category(
              image_location: "assets/21.png",
              image_name: "",
            ),
            Category(
              image_location: "assets/22.png",
              image_name: "",
            ),
            Category(
              image_location: "assets/23.png",
              image_name: "",
            ),
            Category(
              image_location: "assets/24.png",
              image_name: "",
            ),
            Category(
              image_location: "assets/25.png",
              image_name: "",
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
                onTap: ()=>()=>Navigator.pop(context),),
            ListTile(
                title: Center(child:Text(AppLocalizations.of(context).translate('m_best'),style: TextStyle(fontSize:22,fontWeight: FontWeight.bold,color: Colors.purple[500],fontFamily: "mobily"),),),
                onTap:()=>Navigator.push(context,MaterialPageRoute(builder: (_) =>Best_sal_order()),)),
            ListTile(
              title:Center(child: Text(AppLocalizations.of(context).translate('m_city'),style: TextStyle(fontSize:22,fontWeight: FontWeight.bold,color: Colors.purple[500],fontFamily: "mobily"),),),
              onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (_) =>Buy_creadet()),),),


            Image.asset("assets/9.png"),
          ],
        ),
      ),
    );
  }}
class Category extends StatelessWidget {
  final String image_location;
  final String image_name;

  Category({this.image_location,this.image_name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: InkWell(
        onTap: () =>Navigator.push(context,MaterialPageRoute(builder: (_) =>Home()),),
        child: Container(
          child: ListTile(
              title: Image.asset(
                image_location,
                width: 100.0,
                height: 400.0,
              ),
            subtitle: Text(image_name,style: TextStyle(fontSize:22,fontWeight: FontWeight.bold,color: Colors.purple[500],fontFamily: "mobily"),),
          ),
        ),
      ),
    );
  }
}
