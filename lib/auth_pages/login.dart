import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:teledoc_admin/pages/patient_list.dart';
import 'package:patient_teledoc/auth_pages/reg.dart';
import 'package:patient_teledoc/main.dart';
import 'package:patient_teledoc/pages/home.dart';

bool isloggedin;

class login_page extends StatefulWidget {
  login_page({Key key}) : super(key: key);

  @override
  _login_pageState createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  TextEditingController username = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future<String> authentication(dynamic username) async {
    Map<String, dynamic> postData = {'User': '1', 'Patient_Id': '$username'};
    http.Response check = await http.post('http://54.162.56.164:5000/signin',
        body: jsonEncode(postData),
        headers: {
          "content-type": "application/json",
          "Access-Control-Allow-Origin":
              "*", // Required for CORS support to work
          "Access-Control-Allow-Credentials":
              "true", // Required for cookies, authorization headers with HTTPS
          "Access-Control-Allow-Headers":
              "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
          "Access-Control-Allow-Methods": "POST, OPTIONS"
        });
    var authData = jsonDecode(check.body);
    // print(authData[0][5].toString());
    return authData[0][5].toString();
  }

  @override
  Widget build(BuildContext context) {
    var len = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(0, 55, 80, 1),
        alignment: Alignment.center,
        // width: MediaQuery.of(context).size.width * 1,
        // height: MediaQuery.of(context).size.height * 1,
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(
                //   height: 1,
                // ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  // child: CircleAvatar(
                  //   backgroundColor: Color.fromRGBO(255, 255, 255, 0),
                  //   radius: len.width * 0.15,
                  //   backgroundImage: AssetImage('assets/images/logoWhite.png'),
                  // ),
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/images/logoWhite.png', scale: 6),
                    ],
                  ),
                  // child: Column(
                  // children: <Widget>[
                  //   Image.asset('assets/images/GeeksforGeeks.jpg'),
                  // ],
                ),
                Text(
                  'Welcome to',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  'TeleDoc',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 57,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  //height: MediaQuery.of(context).size.height*0.7,
                  decoration: BoxDecoration(
                      // boxShadow: [
                      //   BoxShadow(spreadRadius: 0.2, offset: Offset(0, 2.0))
                      // ],
                      color: Color.fromRGBO(0, 90, 130, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    controller: username,
                    decoration: InputDecoration(
                        fillColor: Color.fromRGBO(0, 90, 130, 1),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Registered Mobile Number",
                        labelStyle: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                      // boxShadow: [
                      //   BoxShadow(spreadRadius: 0.2, offset: Offset(0, 2.0))
                      // ],
                      color: Color.fromRGBO(0, 90, 130, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                    controller: pass,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                // FutureBuilder(
                //   future: authentication(doc_Id.text),
                //   builder: (BuildContext context, AsyncSnapshot snapshot) =>
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                        padding: EdgeInsets.all(10),
                        color: Color.fromRGBO(0, 64, 93, 1),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        onPressed: () {
                          //init('phone_number', '${phone_num.text}');
                          Future<String> auth = authentication(username.text);
                          auth.then((value) {
                            if (value == pass.text) {
                              print('1');
                              // SharedPreferences pref =
                              //     await SharedPreferences.getInstance();
                              pref.setString('username', '${username.text}');
                              //init('phone_num', phone_num.text);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) {
                                        return HomePage();
                                      },
                                      fullscreenDialog: true));
                            } else if (value == null) {
                              print('No account with this username');
                              AlertDialog(
                                title: Text('No account with this username'),
                              );
                            } else {
                              print('Username or Password is wrong');
                              AlertDialog(
                                title: Text(
                                  'Username or Password is wrong',
                                  style: TextStyle(fontSize: 20),
                                ),
                              );
                            }
                          });
                        },
                        child: SizedBox(
                          width: 120,
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    RaisedButton(
                      color: Color.fromRGBO(0, 64, 93, 1),
                      padding: EdgeInsets.all(10),
                      child: SizedBox(
                        width: 120,
                        child: Center(
                          child: Text(
                            'Register',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Admin_Registration(),
                                fullscreenDialog: true));
                      },
                    )
                  ],
                ),
                //),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
