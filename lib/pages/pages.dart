import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpref/model/usermodel.dart';
import 'package:sharedpref/service/Prefs.dart';

class MyHomePage extends StatefulWidget {
  static final String id = "myhomepage";

  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final emailcontroller = TextEditingController();
  final passwordcomntroller = TextEditingController();

  void _doLogin() {
    String email = emailcontroller.text.toString().trim();//trim spaceni olib tashlaydi
    String password = passwordcomntroller.text.toString().trim();
    User user = new User.from(email: email, password: password);
    Prefs.storeUser(user);
    Prefs.loaduser().then((value) => {
      print(user.email),
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: 20,left: 20,),
              height: 50,
              padding: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.grey[200],
              ),
              child: TextField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  hintText: "Email",
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.email,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(right: 20,left: 20),
              height: 50,
              padding: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.grey[200],
              ),
              child: TextField(
                controller: passwordcomntroller,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.password,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              height: 50,
              width: double.infinity,
              //color: Colors.grey[200],
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.blue
              ),
              child: FlatButton(

                onPressed: _doLogin,
                child: Text("Login",style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
