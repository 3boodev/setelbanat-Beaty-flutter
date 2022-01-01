import 'package:flutter/material.dart';
import '../main.dart';
import 'auth/login.dart';
import 'home.dart';
import'callus.dart';
import 'about.dart';
import 'catogry.dart';
import '../shared/component/app_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
class Best_sal_order extends StatelessWidget {
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
        home: BestSalorder_Page(),
        routes: <String,WidgetBuilder>{
          "/main":(BuildContext context)=>MyApp(),
          "/login":(BuildContext context)=>Login(),
        }
    );
  }
}
class BestSalorder_Page extends StatefulWidget {
  @override
  BestSalorderState createState() {
    return new BestSalorderState();
  }
}

class BestSalorderState extends State<BestSalorder_Page> with SingleTickerProviderStateMixin  {
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
      body:
                Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/26.png"),
                        fit: BoxFit.cover,
                      ),),
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: Key('f'),
                          background: Container(
                            alignment: AlignmentDirectional.centerEnd,
                            color: Colors.red,
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                          onDismissed: (direction) {
                            setState(() {
                            });
                          },
                          direction: DismissDirection.endToStart,
                          child: Card(
                            elevation: 5,
                            margin: EdgeInsets.all(30),
                            child: Container(
                              height: 250,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 150,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 2),
                                      child: Column(
                                        children: <Widget>[
                                          Text('                             ملد - الخالديه  '),
                                          Text('                          ______________ '),
                                          SizedBox(height: 10,),
                                          Text("                           العروض متاحه في الداتا بيس   "
                                            ,style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 48, 48, 54)),),
                                          SizedBox(height: 10,),
                                        //  Padding(padding: EdgeInsets.only(left: 100),child:RaisedButton(onPressed: null,child: Text('عرض المزيد',style: TextStyle(fontWeight: FontWeight.bold,color:Colors.white,fontSize: 22,fontFamily: "mobily"),),color: Colors.pink,) ,),
                                          new InkWell(
                                            onTap: (){
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(left: 100),
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(0),
                                                  gradient: LinearGradient(colors: [
                                                    Colors.pink,
                                                    Colors.pink
                                                  ])),
                                              child: Center (
                                                child:Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Container(
                                                      child:
                                                      Row(children: <Widget>[
                                                        SizedBox(width: 5,),
                                                        Text(AppLocalizations.of(context).translate('show_more'),style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold,fontFamily: "mobily"),),
                                                        SizedBox(width: 5,),
                                                      ],),

                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )),


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
                onTap:()=>Navigator.push(context,MaterialPageRoute(builder: (_) =>Home()),)),

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
              onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (_) =>Best_sal_order()),),),

            Image.asset("assets/9.png"),
          ],
        ),
      ),
    );
  }}
