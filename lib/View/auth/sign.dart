import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../main.dart';
import '../../shared/component/app_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../home.dart';
import 'login.dart';
import '../../Controllers/databasehelper.dart';
import 'package:progress_dialog/progress_dialog.dart';

class Signup extends StatelessWidget {
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

        home: SignPage(),
        routes: <String,WidgetBuilder>{
          "/main":(BuildContext context)=>MyApp(),
          "/login":(BuildContext context)=>Login(),
          "/home":(BuildContext context)=>Home(),
        }
    );
  }
}
class SignPage extends StatefulWidget {
  @override
  SignPageState createState() {
    return new SignPageState();
  }
}

class SignPageState extends State<SignPage> {
  ProgressDialog pr;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }
  void _showDialog(){
    showDialog(
        context:context ,
        builder:(BuildContext context){
          return AlertDialog(
            title: new Text('Failed'),
            content:  new Text('Check your email or password'),
            actions: <Widget>[
              new RaisedButton(
                child: new Text('Close',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontFamily: "mobily",color: Colors.white),),
                onPressed: (){
                  Navigator.of(context).pop();
                },

              ),
            ],
          );
        }
    );
  }


  DatabaseHelper databaseHelper = new DatabaseHelper();


  final TextEditingController _fnameController = new TextEditingController();
  final TextEditingController _lnameController = new TextEditingController();
  final TextEditingController _phoneController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  String __imageController ="";

  _onPressed(){
    setState(() {
      if(_emailController.text.trim().toLowerCase().isNotEmpty && _passwordController.text.trim().isNotEmpty ){
        databaseHelper.registerData(_fnameController.text.trim(),_lnameController.text.trim(),__imageController,_phoneController.text.trim(),_emailController.text.trim().toLowerCase(), _passwordController.text.trim())
            .whenComplete((){
          if(databaseHelper.status==200){
            Navigator.of(context).pushNamed("/login");
            Fluttertoast.showToast(
                msg: "تم تسجيل الدخول بنجاح",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor:Colors.black45,
                textColor: Colors.white,
                fontSize: 16
            );
          }else{
            _showDialog();
            Fluttertoast.showToast(
                msg: "Check email or password",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor:Colors.black45,
                textColor: Colors.white,
                fontSize: 16
            );
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context,type: ProgressDialogType.Normal);
    pr.style(message: 'Please wait...',
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      progressWidget: CircularProgressIndicator(backgroundColor: Colors.red[400],strokeWidth: 3,),
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      progressTextStyle: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
    );
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(title: Text(AppLocalizations.of(context).translate('register'),
          style: TextStyle(color: Colors.black54,fontFamily: "mobily",fontWeight: FontWeight.bold),),backgroundColor: Colors.white,
          leading: IconButton(onPressed: ()=>Navigator.of(context).pushNamed("/login"),icon: Icon(Icons.keyboard_backspace,color: Colors.black54,)),),
        body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/lore.png"),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.black12

                ),

                child: Column(
                    children: <Widget>[
                      SizedBox(height: 150,),
                      new Container(
                        alignment: Alignment.center,
                        height: 52.0,
                        width: 330.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25.0)),
                        child: TextField(
                          controller: _fnameController,
                          onChanged: (value) {
                            setState(() {
                            });
                          },
                          decoration: InputDecoration(

                            hintText:  AppLocalizations.of(context).translate('first_name'),
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: "mobily"),
                            contentPadding: EdgeInsets.only(left: 15),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0,),

                      new Container(
                        alignment: Alignment.center,
                        height: 52.0,
                        width: 330.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25.0)),
                        child: TextField(
                          controller: _lnameController,
                          onChanged: (value) {
                            setState(() {
                            });
                          },
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context).translate('second_name'),
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: "mobily"),
                            contentPadding: EdgeInsets.only(left: 15),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      new Container(
                        alignment: Alignment.center,
                        height: 52.0,
                        width: 330.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25.0)),
                        child: TextField(
                          controller: _phoneController,
                          onChanged: (value) {
                            setState(() {
                            });
                          },
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context).translate('phone'),
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: "mobily"),
                            contentPadding: EdgeInsets.only(left: 15),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      new Container(
                        alignment: Alignment.center,
                        height: 52.0,
                        width: 330.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25.0)),
                        child: TextField(
                          controller: _emailController,
                          onChanged: (value) {
                            setState(() {
                            });
                          },
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context).translate('email'),
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: "mobily"),
                            contentPadding: EdgeInsets.only(left: 15),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      new Container(
                        alignment: Alignment.center,
                        height: 52.0,
                        width: 330.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25.0)),
                        child: TextField(
                          controller: _passwordController,
                          onChanged: (value) {
                            setState(() {
                            });
                          },
                          obscureText: _secureText,
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context).translate('password'),
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: "mobily"),
                            contentPadding: EdgeInsets.only(left: 1),
                            border: InputBorder.none,
                            icon:IconButton(
                              onPressed: showHide,
                              icon: Icon(_secureText ? Icons.visibility_off: Icons.visibility),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      new InkWell(
                        onTap: (){
                          pr.show();
                          Future.delayed(Duration(seconds: 8)).then((onValue){
                            _onPressed();
                            if(pr.isShowing())
                              pr.hide();
                          });
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
                                    Text(AppLocalizations.of(context).translate('register'),style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold,fontFamily: "mobily"),),
                                  ],),

                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                InkWell(
                    onTap: ()=>Navigator.of(context).pushNamed("/login"),
                    child:
                      Container(
                        margin: EdgeInsets.only(top: 20,left: 95,right: 100),
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            gradient: LinearGradient(colors: [
                              Colors.grey[200],
                              Colors.grey[200]
                            ])),
                        child: Center (
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child:
                                Row(children: <Widget>[
                                  SizedBox(width: 90,),
                                  Text(AppLocalizations.of(context).translate('login'),style: TextStyle(fontSize:22,color: Colors.pink[800],fontWeight: FontWeight.bold,fontFamily: "mobily"),),
                                ],),
                              )
                            ],
                          ),
                        ),
                      ),
                ),
         ]))));
  }}