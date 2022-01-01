import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'about.dart';
import 'auth/login.dart';
import 'callus.dart';
import 'catogry.dart';
import 'home.dart';
import 'buy_credet.dart';
import 'best_sal_orders.dart';
import '../shared/component/app_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
class Salon extends StatelessWidget {

  // This widget is the root of your application.
  final scaffoldKey = GlobalKey<ScaffoldState>();


  Widget image_carousel = new Container(
    padding: EdgeInsets.only(right: 10,left: 10,top: 5),
    height: 700 / 4,
    child:  new Carousel(
      dotColor: Colors.pink,
      dotBgColor: Color.fromRGBO(247,245 , 242, 2.1),
      autoplay: true,
      autoplayDuration: Duration(seconds: 2),
      boxFit: BoxFit.cover,
      images: [
        new AssetImage('assets/3.png'),
        new AssetImage('assets/6.png'),
      ],
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(seconds: 1),
    ),);
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
      home: DefaultTabController(length: 3, child: Scaffold(

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
            unselectedLabelColor: Colors.pink[800],
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.pink[800]
              ),
              tabs: [
                Tab(child:Container(width: 150,decoration: BoxDecoration(borderRadius: BorderRadius.circular(2),border: Border.all(color: Colors.pink[800],width: 1)),child: Align(child:  Text(AppLocalizations.of(context).translate('offers'),style: TextStyle(fontSize: 18,fontFamily: "mobily",fontWeight: FontWeight.bold)),),)),
                Tab(child:Container(width: 150,decoration: BoxDecoration(borderRadius: BorderRadius.circular(2),border: Border.all(color: Colors.pink[800],width: 1)),child: Align(child:  Text(AppLocalizations.of(context).translate('service'),style: TextStyle(fontSize: 18,fontFamily: "mobily",fontWeight: FontWeight.bold)),),)),
                Tab(child:Container(width: 150,decoration: BoxDecoration(borderRadius: BorderRadius.circular(2),border: Border.all(color: Colors.pink[800],width: 1)),child: Align(child:  Text(AppLocalizations.of(context).translate('about_salon'),style: TextStyle(fontFamily: "mobily",fontSize: 18,fontWeight: FontWeight.bold),),))),
              ]),
        ),
        body: TabBarView(children: [
          Column(
            children: <Widget>[
              SizedBox(height: 100,),
              Padding(padding: EdgeInsets.only(left: 25),child: Image.asset('assets/29.png'),),
              SizedBox(height: 10,),
              Text(AppLocalizations.of(context).translate('no_offer'),style: TextStyle(color: Colors.black54,fontSize: 18,fontFamily: "mobily",fontWeight: FontWeight.bold),),

            ],
          ),
          GridView.count(
            crossAxisCount: 3,
            padding: EdgeInsets.only(top: 90),
            children:[
              Category(
                image_location: "assets/30.png",
                image_caption: "قص الشعر",
              ),
              Category(
                image_location: "assets/31.png",
                image_caption: "قص الشعر",
              ),
              Category(
                image_location: "assets/32.png",
                image_caption: "قص الشعر",
              ),
              Category(
                image_location: "assets/33.png",
                image_caption: "قص الشعر",
              ),
              Category(
                image_location: "assets/34.png",
                image_caption: "قص الشعر",
              ),
              Category(
                image_location: "assets/35.png",
                image_caption: "قص الشعر",
              ),
              Category(
                image_location: "assets/36.png",
                image_caption: "قص الشعر",
              ),
              Category(
                image_location: "assets/37.png",
                image_caption: "قص الشعر",
              ),
              Category(
                image_location: "assets/38.png",
                image_caption: "قص الشعر",
              ),

            ]),
          Column(children: <Widget>[
            image_carousel,
            SizedBox(height: 5,),
            Row(children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 5,left: 3),child:  Text('جده , المملكه العربيه السعوديه ,2504-2662 ,سلمان النقات ,\n            السلامه , جده 23525 ,المملكه العربيه السعوديه\n                                   هله خبيره مكياج ورموش',style: TextStyle(fontSize:14,fontWeight: FontWeight.bold,color: Colors.black26,fontFamily: "mobily"),textDirection: TextDirection.rtl,)),
              Padding(padding: EdgeInsets.only(top: 5,left: 4),child:  Icon(Icons.location_on,size: 40,color: Colors.pink,),),
            ],),

            Row(children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 5,left: 260),child:  Text('96689568269',style: TextStyle(fontSize:14,fontWeight: FontWeight.bold,color: Colors.black26,fontFamily: "mobily"),textDirection: TextDirection.rtl,)),
              Padding(padding: EdgeInsets.only(top: 5,left: 6),child:  Icon(Icons.phone,size: 30,color: Colors.pink,),),
            ],),
            SizedBox(height: 2,),
            Padding(padding: EdgeInsets.only(left: 300),child:  Text('ساعات العمل ',style: TextStyle(fontSize:14,fontWeight: FontWeight.bold,color: Colors.black26,fontFamily: "mobily"),)),
          Row(children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 100),child:  Text('من 6 صباحاً الي 8 مساءً',style: TextStyle(fontSize:14,fontWeight: FontWeight.bold,color: Colors.black26,fontFamily: "mobily"),)),
            Padding(padding: EdgeInsets.only(left: 3),child:  Text(' : السبت ',style: TextStyle(fontSize:14,fontWeight: FontWeight.bold,color: Colors.pink,fontFamily: "mobily"),)),
          ],),
            Row(children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 20),child:  Text('من 6 صباحاً الي 8 مساءً',style: TextStyle(fontSize:14,fontWeight: FontWeight.bold,color: Colors.black26,fontFamily: "mobily"),)),
              Padding(padding: EdgeInsets.only(left: 3),child:  Text(' : (الاحد - الاثنين - الثلاث - الأربعاء - الخميس)',style: TextStyle(fontSize:14,fontWeight: FontWeight.bold,color: Colors.pink,fontFamily: "mobily"),)),
            ],),
            Row(children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 195),child:  Text('اجازه',style: TextStyle(fontSize:14,fontWeight: FontWeight.bold,color: Colors.black26,fontFamily: "mobily"),)),
              Padding(padding: EdgeInsets.only(left: 3),child:  Text(' : الجمعه',style: TextStyle(fontSize:14,fontWeight: FontWeight.bold,color: Colors.pink,fontFamily: "mobily"),)),
            ],),

            Padding(padding: EdgeInsets.only(left: 300),child:  Text('خبيرات التجميل ',style: TextStyle(fontSize:14,fontWeight: FontWeight.bold,color: Colors.black26,fontFamily: "mobily"),)),
            Container(
              height: 120.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/11.png"),
                    radius:45 ,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(width: 19,),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/13.png"),
                    radius:45 ,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(width: 19,),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/14.png"),
                    radius:45 ,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(width: 19,),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/15.png"),
                    radius:45 ,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(width: 19,),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/16.png"),
                    radius:45 ,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(width: 19,),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/40.png"),
                    radius:45 ,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(width: 19,),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/39.png"),
                    radius:45 ,
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
            )
          ],),

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
      ),),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({this.image_location, this.image_caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
              title: Image.asset(
                image_location,
                width: 100.0,
                height: 80.0,
              ),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(image_caption, style: TextStyle(fontFamily: "mobily",fontSize: 18,fontWeight: FontWeight.bold,color: Colors.purple), ),
              )
          ),
        ),
      ),
    );
  }
}