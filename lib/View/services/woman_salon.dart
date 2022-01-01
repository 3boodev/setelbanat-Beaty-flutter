import 'package:flutter/material.dart';
import 'file:///C:/Users/abdal/AndroidStudioProjects/setelbanat/lib/View/home.dart';
import '../about.dart';
import '../auth/login.dart';
import '../callus.dart';
import '../catogry.dart';
import '../buy_cart_photo.dart';
import '../best_sal_orders.dart';
import 'hair_service.dart';
import '../../shared/component/app_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
class women_Salon extends StatelessWidget {
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
              unselectedLabelColor: Colors.pink[800],
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.pink[800]
              ),
              tabs: [
                Tab(child:Container(width: 150,decoration: BoxDecoration(borderRadius: BorderRadius.circular(2),border: Border.all(color: Colors.pink[800],width: 1)),child: Align(child:  Text(AppLocalizations.of(context).translate('w_salon'),style: TextStyle(fontSize: 18,fontFamily: "mobily",fontWeight: FontWeight.bold)),),)),
              ]),
        ),
        body: TabBarView(children: [

          GridView.count(
              crossAxisCount: 3,
              padding: EdgeInsets.only(top: 30),
              children:[
                Category(
                  image_location: "assets/30.png",
                  image_caption: "شعر",
                ),
                Category(
                  image_location: "assets/31.png",
                  image_caption: "مكياج",
                ),
                Category(
                  image_location: "assets/32.png",
                  image_caption: "عيون وحواجب",
                ),
                Category(
                  image_location: "assets/33.png",
                  image_caption: "حمام مغربي ",
                ),
                Category(
                  image_location: "assets/34.png",
                  image_caption: "الصحه والجمال",
                ),
                Category(
                  image_location: "assets/35.png",
                  image_caption: "سبا",
                ),
                Category(
                  image_location: "assets/36.png",
                  image_caption: "اظافر",
                ),
                Category(
                  image_location: "assets/37.png",
                  image_caption: "وجه",
                ),
                Category(
                  image_location: "assets/35.png",
                  image_caption: "باقات العروسه",
                ),
                Category(
                  image_location: "assets/36.png",
                  image_caption: "خدمات الاطفال",
                ),
                Category(
                  image_location: "assets/37.png",
                  image_caption: "خدمات اخري",
                ),
              ]),
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
                onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (_) =>Buy_by_photo()),),),

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
                child: InkWell(onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (_) =>Hair_service())),child:Text(image_caption, style: TextStyle(fontFamily: "mobily",fontSize: 14,fontWeight: FontWeight.bold,color: Colors.purple), ),),
              )
          ),
        ),
      ),
    );
  }
}