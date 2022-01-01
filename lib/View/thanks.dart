import 'package:flutter/material.dart';
import '../main.dart';
import 'auth/login.dart';
import 'home.dart';
import '../shared/component/app_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
class Thanks extends StatelessWidget {
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
        home: Thanks_Page(),
        routes: <String,WidgetBuilder>{
          "/main":(BuildContext context)=>MyApp(),
          "/login":(BuildContext context)=>Login(),
          "/home":(BuildContext context)=>Home(),
        }
    );
  }
}
class Thanks_Page extends StatefulWidget {
  @override
  Thanks_State createState() {
    return new Thanks_State();
  }
}

class Thanks_State extends State<Thanks_Page> {
  TextEditingController emailTextController = TextEditingController();

  TextEditingController passwordTextController = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        body: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.only(top: 25),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/ver_forget.png"),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.black12

                ),

                child: Column(
                    children: <Widget>[
                      SizedBox(height: 330,),
                      new Container(
                          alignment: Alignment.center,
                          height: 105.0,
                          width: 330.0,
                          child: Column(children: <Widget>[
                            Text(AppLocalizations.of(context).translate('thanks'),style: TextStyle(fontSize: 20,color: Colors.pink[800],fontFamily: "mobily",fontWeight: FontWeight.bold),),
                            Text(AppLocalizations.of(context).translate('thanks_text'),style: TextStyle(fontSize: 16,color: Colors.black87,fontFamily:  'mobily'),),
                          ],)
                      ),
                      SizedBox(height: 60.0,),
                      new InkWell(
                        onTap: (){Navigator.of(context).pushNamed("/home");},
                        child: Container(
                          margin: EdgeInsets.only(left: 100,right: 100),
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              gradient: LinearGradient(colors: [
                                Colors.pink[900],
                                Colors.pink[900]
                              ])),
                          child: Center (
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child:
                                  Row(children: <Widget>[
                                    SizedBox(width: 20,),
                                    Text(AppLocalizations.of(context).translate('m_home'),style: TextStyle(fontSize: 22,color: Colors.white,fontFamily: 'mobily',fontWeight: FontWeight.bold),),
                                    SizedBox(width: 20,),
                                  ],),

                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]))));
  }}