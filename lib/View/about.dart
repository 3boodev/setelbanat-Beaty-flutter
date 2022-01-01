import 'package:flutter/material.dart';
import '../main.dart';
import 'auth/login.dart';
import 'home.dart';
import 'callus.dart';
import 'best_sal_orders.dart';
import 'catogry.dart';
import 'thanks.dart';
import '../shared/component/app_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
class About extends StatelessWidget {
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
        home: About_Page(),
        routes: <String,WidgetBuilder>{
          "/main":(BuildContext context)=>MyApp(),
          "/login":(BuildContext context)=>Login(),
        }
    );
  }
}
class About_Page extends StatefulWidget {
  @override
  About_PageState createState() {
    return new About_PageState();
  }
}

class About_PageState extends State<About_Page> with SingleTickerProviderStateMixin  {
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
                Padding(padding: EdgeInsets.only(top: 3,left: 310),child:  Text(AppLocalizations.of(context).translate('about'),style: TextStyle(fontSize:22,fontWeight: FontWeight.bold,color: Colors.black54,fontFamily: "mobily"),)),
               SizedBox(height: 50,),
                Center(child: Center(child: Text('       هذا الابليكشن هو سبيل الوصول لجميع عيادات التجميل\n والمتخصصات بامان وبسرعه،وهذا يعتبر الابلكيشن الاول الذي \n    يضمن لك الوصول السريع والسهل لجميع العيادات \n '
                    ' \nهذا الابليكشن هو سبيل الوصول لجميع عيادات التجميل\n والمتخصصات بامان وبسرعه , وهذا يعتبر الابليكشن الأول الذى\n    يضمن لك الوصول السريع والسهل لجميع العيادات  \n    '
                    ' \nهذا الابليكشن هو سبيل الوصول لجميع عيادات التجميل \n والمتخصصات بامان وبسرعه،وهذا يعتبر الابلكيشن الاول الذي  \n    يضمن لك الوصول السريع والسهل لجميع العيادات '
                  ,style: TextStyle(fontSize:16,color: Colors.purple[400],fontFamily: "mobily",fontWeight: FontWeight.bold),textDirection: TextDirection.rtl,),),),

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
                onTap:()=>Navigator.pop(context)),

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
              onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (_) =>Thanks()),),),

            Image.asset("assets/9.png"),
          ],
        ),
      ),
    );
  }}
