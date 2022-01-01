import 'package:flutter/material.dart';
import 'buy_cart_photo.dart';
import '../shared/component/app_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
class Buy_creadet extends StatelessWidget {
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
        home: DefaultTabController(length: 2, child: Scaffold(

          appBar: AppBar(
            actions: <Widget>[Padding(padding: EdgeInsets.only(right: 160),child: Image.asset('assets/27.png'),),],
            backgroundColor: Colors.white,
            bottom: TabBar(
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey
                ),
            tabs: [
              Tab(child: Text(AppLocalizations.of(context).translate('credet'),style: TextStyle(color: Colors.red,fontSize: 18,fontFamily: "mobily",fontWeight: FontWeight.bold)),),
              Tab(child: Text(AppLocalizations.of(context).translate('fawry'),style: TextStyle(color: Colors.red,fontSize: 18,fontFamily: "mobily",fontWeight: FontWeight.bold),),),
            ]),
          ),
          body: TabBarView(children: [
            Column(children: <Widget>[
              new Container(
                margin: EdgeInsets.only(top: 100),
                alignment: Alignment.center,
                height: 52.0,
                width: 330.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0)),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context).translate('user'),
                    hintStyle: TextStyle(fontWeight: FontWeight.w500,fontFamily:"mobily"),
                    contentPadding: EdgeInsets.only(left: 20),
                    border: InputBorder.none,

                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              new Container(
                alignment: Alignment.center,
                height: 52.0,
                width: 330.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0)),
                child: TextField(
                  onChanged: (value) {
                  },

                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context).translate('card_num'),
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,fontFamily: "mobily"),
                    contentPadding: EdgeInsets.only(left: 1),
                    border: InputBorder.none,
                    icon:IconButton(
                      onPressed: null,
                      icon: Icon( Icons.replay),
                    ),
                  ),
                ),
              ),
              Row(children: <Widget>[
                SizedBox(width: 45,),
                 Container(
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  height: 52,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText:AppLocalizations.of(context).translate('date'),
                      hintStyle: TextStyle(fontWeight: FontWeight.w500,fontFamily:"mobily",fontSize: 14),
                      contentPadding: EdgeInsets.only(left: 5),
                      border: InputBorder.none,

                    ),
                  ),
                ),
                SizedBox(width: 25.0,),
                new Container(
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  height: 52.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: TextField(

                    decoration: InputDecoration(
                      hintText: "cvv",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,fontFamily: "mobily"),
                      contentPadding: EdgeInsets.only(left: 5),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],),
              SizedBox(height: 10,),
              Row(children: <Widget>[
                SizedBox(width: 190,),
                Text(AppLocalizations.of(context).translate('save_card'),style: TextStyle(color: Colors.black54,fontSize: 16,fontFamily: "mobily",),),
                Checkbox(value: true, activeColor: Colors.white,onChanged: null,checkColor:Colors.pink ,key: Key('احفظ بيانات هذاالكارت '),tristate:true ,),
              ],),
          SizedBox(height: 10.0,),
      new InkWell(
        onTap: (){
        },
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
                    SizedBox(width: 2,),
                    Text(AppLocalizations.of(context).translate('buy'),style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold,fontFamily: "mobily"),),
                  ],),
                )
              ],
            ),
          ),
        ),
      ),],),
            Column(children: <Widget>[

              Card(margin: EdgeInsets.all(70),color: Colors.white,child: Column(children: <Widget>[
                Text(AppLocalizations.of(context).translate('code_fawry'),style: TextStyle(color: Colors.black54,fontSize: 18,fontFamily: "mobily",fontWeight: FontWeight.bold),),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  height: 52.0,
                  width: 330.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "     - - - - - -",
                      hintStyle: TextStyle(fontWeight: FontWeight.bold,fontFamily:"mobily",fontSize: 20),
                      contentPadding: EdgeInsets.only(left: 80.0),
                      border: InputBorder.none,

                    ),
                  ),
                ),
              ],),),
    SizedBox(height: 10.0,),
    new InkWell(
      onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (_) =>Buy_by_photo()));
      },
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
                  SizedBox(width: 2,),
                  Text(AppLocalizations.of(context).translate('buy'),style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold,fontFamily: "mobily"),),
                ],),
              )
            ],
          ),
        ),
      ),
    ),
  ],)
          ]),
        ),),
    );
  }
}
