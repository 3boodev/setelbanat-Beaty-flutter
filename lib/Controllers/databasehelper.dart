import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper{
  String serverUrl = "http://setelbanat.codecaique.com/api";
  var status ;
  var token ;

   loginData(String email , String password) async{
      try{
        String myUrl = "$serverUrl/login1";
        final response = await http.post(myUrl,
            body: {
              "email": "$email",
              "password" : "$password"
            });
        status = response.statusCode;
        var data = json.decode(response.body);

        if(status==200){
          print('data : ${data["message"]}');
          _save(data["message"]);
        }else{
          print('data : ${data["error"]}');
        }
      }
      catch(e){ Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor:Colors.black45,
          textColor: Colors.white,
          fontSize: 16
      );}
  }

   registerData(String fname ,String lname ,String image,String phone,String email , String password) async{
    try{
        String myUrl = "$serverUrl/web_registration";
        final response = await  http.post(myUrl,
            body: {
              "first_name": "$fname",
              "last_name": "$lname",
              "image": "$image",
              "phone": "$phone",
              "email": "$email",
              "password" : "$password"
            } ) ;
       status = response.statusCode;
        var data = json.decode(response.body);
        if(status==200){
          print('data : ${data["message"]}');
          _save(data["message"]);
        }else{
          print('data : ${data["error"]}');
        }
       }
    catch(e){ Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor:Colors.black45,
        textColor: Colors.white,
        fontSize: 16
    );}
  }


  Future<List> getData() async{
    String myUrl = "$serverUrl/main_service/";
    http.Response response = await http.get(myUrl,
        headers: {
          'Accept':'application/json',
        }
    );
    return json.decode(response.body);
  }

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'message';
    final value = token;
    prefs.setString(key, value);
  }

  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'message';
    final value = prefs.get(key ) ?? 0;
    print('read : $value');
  }


/*
  void deleteData(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    String myUrl = "$serverUrl/products/$id";
    http.delete(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
    } ).then((response){
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

  void addData(String name , String price) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    String myUrl = "$serverUrl/products";
    http.post(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        },
        body: {
          "name": "$name",
          "price" : "$price"
        }).then((response){
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }


  void editData(int id,String name , String price) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    String myUrl = "http://flutterapitutorial.codeforiraq.org/api/products/$id";
    http.put(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        },
        body: {
          "name": "$name",
          "price" : "$price"
        }).then((response){
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });

  }
*/


}


