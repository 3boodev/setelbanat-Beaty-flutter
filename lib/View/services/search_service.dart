import 'package:flutter/material.dart';
import '../../main.dart';
import '../about.dart';
import '../auth/login.dart';
import '../home.dart';
import '../callus.dart';
import '../catogry.dart';
import '../buy_credet.dart';
import '../best_sal_orders.dart';
import '../../shared/component/app_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
class Search extends StatelessWidget {
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
        home: Search_Page(),
        routes: <String,WidgetBuilder>{
          "/main":(BuildContext context)=>MyApp(),
          "/login":(BuildContext context)=>Login(),
        }
    );
  }
}
class Search_Page extends StatefulWidget {
  @override
  Search_PageState createState() {
    return new Search_PageState();
  }
}

class Search_PageState extends State<Search_Page> with SingleTickerProviderStateMixin  {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String _selectedservice;
  String _selectedlace;
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
      body: Column(
        children: <Widget>[
          SizedBox(height: 50,),
          Padding(padding: EdgeInsets.only(top: 10,left: 280),child:  Text(AppLocalizations.of(context).translate('dem_service'),style: TextStyle(fontSize:16,fontWeight: FontWeight.bold,color: Colors.black54,fontFamily: "mobily"),)),
          Padding(
            padding: EdgeInsets.only(left: 3,right: 3),
            child:DropdownButton(
              items: [
                DropdownMenuItem<String>(
                  child: Text(AppLocalizations.of(context).translate('hair_cut')),
                  value: AppLocalizations.of(context).translate('hair_cut'),
                ),
                DropdownMenuItem<String>(
                  child: Text(AppLocalizations.of(context).translate('azafer_cut')),
                  value: AppLocalizations.of(context).translate('azafer_cut'),
                ),
                DropdownMenuItem<String>(
                  child: Text(AppLocalizations.of(context).translate('face_buty')),
                  value: AppLocalizations.of(context).translate('face_buty'),
                ),
              ],

              value: _selectedservice,
              onChanged: (newValue) {
                setState(() {
                  _selectedservice = newValue;
                });
              },
              iconEnabledColor: Colors.pink,
              hint: Text(AppLocalizations.of(context).translate('hair_cut'),style:TextStyle(fontSize: 18,color: Colors.pink,fontFamily: "mobily",fontWeight: FontWeight.bold),),
              iconDisabledColor: Colors.pink,
              style: TextStyle(fontSize: 18,color: Colors.pink,fontFamily: "mobily",fontWeight: FontWeight.bold),
            ),
          ),
          //padding widget
          Padding(padding: EdgeInsets.only(top: 5,left: 300),child:  Text(AppLocalizations.of(context).translate('order_place'),style: TextStyle(fontSize:16,fontWeight: FontWeight.bold,color:  Colors.black54,fontFamily: "mobily"),)),
          Padding(
            padding: EdgeInsets.only(left: 3,right: 3),
            child:DropdownButton(
              items: [
                DropdownMenuItem<String>(
                  child: Text(AppLocalizations.of(context).translate('elbwady')),
                  value: AppLocalizations.of(context).translate('elbwady'),
                ),
                DropdownMenuItem<String>(
                  child: Text(AppLocalizations.of(context).translate('elrad')),
                  value: AppLocalizations.of(context).translate('elrad'),
                ),
                DropdownMenuItem<String>(
                  child: Text(AppLocalizations.of(context).translate('maka')),
                  value: AppLocalizations.of(context).translate('maka'),
                ),
              ],
            iconEnabledColor: Colors.pink,
              value: _selectedlace,
              onChanged: (Value) {
                setState(() {
                  _selectedlace = Value;
                });
              },
              hint: Text(AppLocalizations.of(context).translate('elbwady'),style:TextStyle(fontSize: 18,color: Colors.pink,fontFamily: "mobily",fontWeight: FontWeight.bold),),
              iconDisabledColor: Colors.pink,
              style: TextStyle(fontSize: 18,color: Colors.pink,fontFamily: "mobily",fontWeight: FontWeight.bold),
            ),
          ),
          //padding widget
          Padding(padding: EdgeInsets.only(top: 5,left: 310),child:  Text(AppLocalizations.of(context).translate('service_price'),style: TextStyle(fontSize:16,fontWeight: FontWeight.bold,color: Colors.black54,fontFamily: "mobily"),)),
          SizedBox(height: 10,),
          Row(
            children: <Widget>[
              SizedBox(width: 150,),
              Card(margin: EdgeInsets.only(top: 5,right: 5),color: Colors.white,child: Text('250',style: TextStyle(fontSize:16,fontWeight: FontWeight.bold,color: Colors.pink,fontFamily: "mobily"),),),
              SizedBox(width: 30,),
              Icon(Icons.keyboard_backspace,color: Colors.pink,size: 20,),
              SizedBox(width: 30,),
              Card(margin: EdgeInsets.only(top: 5,right: 5),color: Colors.white,child: Text('150',style: TextStyle(fontSize:16,fontWeight: FontWeight.bold,color: Colors.pink,fontFamily: "mobily"),),),

            ],
          ),
          SizedBox(height: 30,),
          new InkWell(
            onTap: (){
              Navigator.of(context).pushNamed("/home");
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
                        SizedBox(width: 15,),
                        Text(AppLocalizations.of(context).translate('Start_search'),style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold,fontFamily: "mobily"),),
                        SizedBox(width: 15,),
                      ],),

                    )
                  ],
                ),
              ),
            ),
          ),
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
              onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (_) =>Buy_creadet()),),),

            Image.asset("assets/9.png"),
          ],
        ),
      ),
    );
  }}
