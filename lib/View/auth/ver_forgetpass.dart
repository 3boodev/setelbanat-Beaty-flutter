import 'package:flutter/material.dart';
import '../../main.dart';
import 'login.dart';
import '../home.dart';

class Ver_Forget_pass extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Set Elbanat',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ver_Forget_pass_Page(),
        routes: <String,WidgetBuilder>{
          "/main":(BuildContext context)=>MyApp(),
          "/login":(BuildContext context)=>Login(),
          "/home":(BuildContext context)=>Home(),
        }
    );
  }
}
class ver_Forget_pass_Page extends StatefulWidget {
  @override
  ver_Forget_passState createState() {
    return new ver_Forget_passState();
  }
}

class ver_Forget_passState extends State<ver_Forget_pass_Page> {
  TextEditingController emailTextController = TextEditingController();

  TextEditingController passwordTextController = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(title: Text('                                       نسيت كلمه المرور',
          style: TextStyle(color: Colors.black54,fontFamily: "mobily",fontWeight: FontWeight.bold),),backgroundColor: Colors.white,
          leading: IconButton(onPressed: ()=>Navigator.of(context).pushNamed("/login"),icon: Icon(Icons.keyboard_backspace,color: Colors.black54,)),),
        body: SingleChildScrollView(
            child: Container(
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
                          Text('  تم ارسال طلب اعاده كلمه المرور للميل',style: TextStyle(fontSize: 20,color: Colors.pink[800],fontFamily: "mobily",fontWeight: FontWeight.bold),),
                          Text('        اعد ادخال الكلمه الجديده من الميل ',style: TextStyle(fontSize: 16,color: Colors.black54,fontFamily:  'mobily'),),
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
                                    Text("       الرئيسيه",style: TextStyle(fontSize: 22,color: Colors.white,fontFamily: 'mobily',fontWeight: FontWeight.bold),),
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