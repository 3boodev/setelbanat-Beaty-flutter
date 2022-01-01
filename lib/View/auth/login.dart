import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../main.dart';
import 'sign.dart';
import '../home.dart';
import 'forgetpass.dart';
import '../../shared/component/app_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../../Controllers/databasehelper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:progress_dialog/progress_dialog.dart';
class Login extends StatelessWidget {
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
        home: LoginPage(),
        routes: <String,WidgetBuilder>{
          "/main":(BuildContext context)=>MyApp(),
          "/sign":(BuildContext context)=>Signup(),
          "/forget":(BuildContext context)=>Forget_pass(),
          "/home":(BuildContext context)=>Home()
        }
    );
  }
}
class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() {
    return new LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {

  ProgressDialog pr;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }


  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'message';
    final value = prefs.get(key);
    if(value != null){
      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => Home(),));
    }
  }
  @override
  // ignore: must_call_super
  initState(){
    read();
  }

  DatabaseHelper databaseHelper =  DatabaseHelper();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  _onPressed(){
    setState(() {
      if(_emailController.text.trim().toLowerCase().isNotEmpty && _passwordController.text.trim().isNotEmpty ){
        databaseHelper.loginData(_emailController.text.trim().toLowerCase(), _passwordController.text.trim()).whenComplete((){
          if(databaseHelper.status==200){
            Navigator.of(context).pushNamed("/home");
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
      }else{
        Fluttertoast.showToast(
            msg: "You Should Enter your Email and Password",
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

  void _showDialog(){
    showDialog(
        context:context ,
        builder:(BuildContext context){
          return AlertDialog(
            title:  Text('Failed Athuntication'),
            content:   Text('Check your email or password'),
            actions: <Widget>[
               RaisedButton(
                child:
                Text('Close',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: "mobily",fontSize: 18),),
                onPressed: ()=>Navigator.of(context).pop(),
              ),
            ],
          );
        }
    );
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
        appBar: AppBar(title: Text(AppLocalizations.of(context).translate('login'), style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black54,fontFamily:"mobily"),),
        backgroundColor: Colors.white,
        leading: Icon(Icons.keyboard_backspace,color: Colors.black54,),),
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
                      SizedBox(height: 30,),
                      //Login Button
                      new Container(
                        margin: EdgeInsets.only(top: 130.0),
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
                            hintText:AppLocalizations.of(context).translate('email_phone'),
                            hintStyle: TextStyle(fontWeight: FontWeight.w500,fontFamily:"mobily",color: Colors.black54),
                            contentPadding: EdgeInsets.only(left: 15),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 25.0,),
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
                                fontWeight: FontWeight.w500,fontFamily: "mobily"),
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
                      Padding(padding: EdgeInsets.only(right: 135),
                        child:InkWell(child:  Text(AppLocalizations.of(context).translate('pass_forget'),style: TextStyle(color: Colors.pink[400],fontFamily: "mobily",fontSize: 18,fontWeight: FontWeight.bold),textDirection: TextDirection.ltr,),onTap: ()=>Navigator.of(context).pushNamed("/forget"),) ),
                      SizedBox(height: 25.0,),
                      new InkWell(
                        onTap: (){
                          pr.show();
                          Future.delayed(Duration(seconds: 5)).then((onValue){
                            _onPressed();
                            if(pr.isShowing())
                              pr.hide();
                          });
                          Navigator.of(context).pushNamed("/home");
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 20,left: 100,right: 100),
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              gradient: LinearGradient(colors: [
                                Colors.purple[200],
                                Colors.purple[200]
                              ])),
                          child: Center (
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child:
                                  Row(children: <Widget>[
                                    SizedBox(width: 5,),
                                    Text(AppLocalizations.of(context).translate('login'),style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold,fontFamily: "mobily"),),
                                  ],),

                                )
                              ],
                            ),
                          ),
                        ),
                      ),
    InkWell(
    onTap: ()=>Navigator.of(context).pushNamed("/sign"),
      child: Container(
        margin: EdgeInsets.only(top: 20,left: 70,right: 60),
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
                  SizedBox(width: 45,),
                  Text(AppLocalizations.of(context).translate('register'),style: TextStyle(fontSize: 30,color: Colors.purple[300],fontWeight: FontWeight.bold,fontFamily: "mobily"),),
                ],),
              )
            ],
          ),
        ),
      ),
    ),
  ]))));
  }}