import 'package:flutter/material.dart';
import '../main.dart';
import 'about.dart';
import 'auth/login.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'horizontal_listview.dart';
import 'best_orders.dart';
import 'famous.dart';
import 'callus.dart';
import 'catogry.dart';
import 'buy_credet.dart';
import 'best_sal_orders.dart';
import 'services/search_service.dart';
import 'services/woman_salon.dart';
import '../shared/component/app_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
class Home extends StatelessWidget {
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
        home: Home_Page(),
        routes: <String,WidgetBuilder>{
          "/main":(BuildContext context)=>MyApp(),
          "/login":(BuildContext context)=>Login(),
        }
    );
  }
}
class Home_Page extends StatefulWidget {
  @override
  Home_PageState createState() {
    return new Home_PageState();
  }
}

class Home_PageState extends State<Home_Page> with SingleTickerProviderStateMixin  {
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
    double screenHeight = MediaQuery.of(context).size.height;

    Widget image_carousel = new Container(
        padding: EdgeInsets.only(right: 10,left: 10,top: 5),
        height: screenHeight / 4,
        child:  new Carousel(
          dotColor: Colors.pink,
          dotBgColor: Color.fromRGBO(247,245 , 242, 2.1),
          autoplay: true,
          autoplayDuration: Duration(seconds: 3),
          boxFit: BoxFit.cover,
          images: [
            new AssetImage('assets/2.png'),
            new AssetImage('assets/3.png'),
            new AssetImage('assets/6.png'),
          ],
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(seconds: 1),
        ),);
    return Scaffold(
      backgroundColor: Colors.white,
        key: scaffoldKey,
        appBar: AppBar
          (
          backgroundColor: Colors.white,
          leading: Text(''),
          actions: <Widget>[
             Padding(padding: EdgeInsets.only(right:100,),child:IconButton(icon: Icon(Icons.search,color: Colors.black54,), onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder: (_) =>Search()),)) ,),
            Padding(padding: EdgeInsets.only(right:100,),child:  Image.asset("assets/hpic.png"),),
            Padding(padding: EdgeInsets.only(right:10,),child: IconButton(icon: new Icon(Icons.menu,color: Colors.black54,), onPressed: () => scaffoldKey.currentState.openEndDrawer()))
          ],
        ),
        /*
      body:Container(
          height: 140.0,
          child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                image_carousel,
                Padding(padding: EdgeInsets.only(top: 3,left: 310),child:  Text('الخدمات ',style: TextStyle(fontSize:22,fontWeight: FontWeight.bold,color: Colors.purple[500],fontFamily: "mobily"),)),
                //Horizontal list view begins here
                HorizontalList(),
                //padding widget
                Padding(padding: EdgeInsets.only(top: 5,left: 280),child:  Text('العروض المميزه ',style: TextStyle(fontSize:22,fontWeight: FontWeight.bold,color: Colors.purple[500],fontFamily: "mobily"),)),
                //grid view
                Flexible(child: BestOrder()),
                //padding widget
                Padding(padding: EdgeInsets.only(top: 5,left: 280),child:  Text('المشاهير ',style: TextStyle(fontSize:22,fontWeight: FontWeight.bold,color: Colors.purple[500],fontFamily: "mobily"),)),
                //grid view
                Flexible(child: Famous()),
              ])),
        */

        body: Column(
     children: <Widget>[
       image_carousel,
      Padding(padding: EdgeInsets.only(top: 3,left: 310),child:  Text(AppLocalizations.of(context).translate('service'),style: TextStyle(fontSize:22,fontWeight: FontWeight.bold,color: Colors.purple[500],fontFamily: "mobily"),)),
       //Horizontal list view begins here
       HorizontalList(),
       //padding widget
       Padding(padding: EdgeInsets.only(top: 3,left: 255),child:  Text(AppLocalizations.of(context).translate('h_best'),style: TextStyle(fontSize:22,fontWeight: FontWeight.bold,color: Colors.purple[500],fontFamily: "mobily"),)),
       //grid view
       Flexible(child: BestOrder()),
       //padding widget
       Padding(padding: EdgeInsets.only(top: 5,left: 310),child:  Text(AppLocalizations.of(context).translate('h_famous'),style: TextStyle(fontSize:22,fontWeight: FontWeight.bold,color: Colors.purple[500],fontFamily: "mobily"),)),
       //grid view
       Flexible(child: Famous()),
    ],),

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
            onTap:()=>Navigator.push(context,MaterialPageRoute(builder: (_) =>women_Salon()),)),

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
            onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (_) =>Buy_creadet()),),),

        Image.asset("assets/9.png"),
      ],
    ),
    ),
    );
  }}
