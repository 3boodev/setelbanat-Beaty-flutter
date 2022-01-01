import 'package:flutter/material.dart';
import '../../main.dart';
import 'login.dart';
import 'ver_forgetpass.dart';
class Forget_pass extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Set Elbanat',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Forget_pass_Page(),
        routes: <String,WidgetBuilder>{
          "/main":(BuildContext context)=>MyApp(),
          "/login":(BuildContext context)=>Login(),
          "/ver_forget":(BuildContext context)=>Ver_Forget_pass(),
        }
    );
  }
}
class Forget_pass_Page extends StatefulWidget {
  @override
  Forget_passState createState() {
    return new Forget_passState();
  }
}

class Forget_passState extends State<Forget_pass_Page> {
  TextEditingController emailTextController = TextEditingController();

  TextEditingController passwordTextController = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(title: Text('                                      نسيت كلمه المرور',
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
                      SizedBox(height: 170,),
                      new Container(
                        alignment: Alignment.center,
                        height: 105.0,
                        width: 330.0,
                        child: Text('               هل نسيت كلمه المرور ؟ \n يرجي ادخال عنوان بريدك الالكتروني الذي \n استخدمته عند تسجيلك في المره الاولي'
                          ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.pink[800],fontFamily: "mobily"),),
                      ),
                      SizedBox(height: 100.0,),

                      new Container(
                        alignment: Alignment.center,
                        height: 52.0,
                        width: 330.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25.0)),
                        child: TextField(
                          controller: emailTextController,
                          onChanged: (value) {
                            setState(() {
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "      ادخل البريد الالكتروني او رقم الهاتف",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontFamily: "mobily"),
                            contentPadding: EdgeInsets.only(left: 80.0),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 60.0,),
                      new InkWell(
                        onTap: (){
                              Navigator.of(context).pushNamed("/ver_forget");
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
                                    Text("   نسيت كلمه المرور",style: TextStyle(fontFamily: "mobily",fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),),
                                    SizedBox(width: 15,),
                                  ],),

                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]))));
  }}