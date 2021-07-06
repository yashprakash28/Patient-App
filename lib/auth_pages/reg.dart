import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:patient_teledoc/auth_pages/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'package:teledoc_admin/auth_pages/bankDetails.dart';

class Admin_Registration extends StatefulWidget {
  Admin_Registration({Key key}) : super(key: key);

  @override
  _Admin_RegistrationState createState() => _Admin_RegistrationState();
}

class _Admin_RegistrationState extends State<Admin_Registration> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Map createMap() {
    Map<String, dynamic> userData = {
      'User': '1',
      'Patient_Id': phoneController.text,
      'name': nameController.text,
      'Age': ageController.text,
      'email': emailController.text,
      'phone': phoneController.text,
      'pass': passController.text,
      'city': cityController.text,
      'state': stateController.text,
      'country': countryController.text,
      'PIN': pinController.text,
    };
    print(userData);
    return userData;
  }

  Future<String> makeNewUser() async {
    print("making new user");
    // Map<String, dynamic> postData = {'username': '$username'};
    Map<String, dynamic> postData = createMap();
    http.Response check = await http.post('http://54.162.56.164:5000/signup',
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
    var statusData = jsonDecode(check.body);
    print("fcscd" + statusData.toString());
    return statusData.toString();
  }

  TextEditingController nameController,
      ageController,
      emailController,
      phoneController,
      cityController,
      stateController,
      countryController,
      passController,
      pinController;

  void initState() {
    super.initState();
    nameController = TextEditingController();
    ageController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    cityController = TextEditingController();
    stateController = TextEditingController();
    countryController = TextEditingController();
    passController = TextEditingController();
    pinController = TextEditingController();
  }

  void dispose() {
    nameController.dispose();
    ageController.dispose();
    emailController.dispose();
    phoneController.dispose();
    cityController.dispose();
    stateController.dispose();
    countryController.dispose();
    passController.dispose();
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Form(
              autovalidateMode: AutovalidateMode.always,
              //autovalidate: true,
              key: formkey,
              child: ListView(
                children: <Widget>[
                  // SizedBox(
                  //   height: 60,
                  // ),
                  Text(
                    'Create Profile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: nameController,
                    decoration: InputDecoration(
                      // focusedBorder: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(10),
                      //     borderSide: BorderSide(
                      //         color: Colors.white,
                      //         style: BorderStyle.solid,
                      //         width: 4)),
                      // enabledBorder: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(10),
                      //     borderSide: BorderSide(
                      //         color: Colors.white,
                      //         style: BorderStyle.solid,
                      //         width: 2)),
                      labelText: "Full Name",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white),
                    controller: ageController,
                    decoration: InputDecoration(
                      // focusedBorder: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(10),
                      //     borderSide: BorderSide(
                      //         color: Colors.white,
                      //         style: BorderStyle.solid,
                      //         width: 4)),
                      // enabledBorder: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(10),
                      //     borderSide: BorderSide(
                      //         color: Colors.white,
                      //         style: BorderStyle.solid,
                      //         width: 2)),
                      labelText: "Age",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    //initialValue: '+91',
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      // focusedBorder: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(10),
                      //     borderSide: BorderSide(
                      //         color: Colors.white,
                      //         style: BorderStyle.solid,
                      //         width: 4)),
                      // enabledBorder: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(10),
                      //     borderSide: BorderSide(
                      //         color: Colors.white,
                      //         style: BorderStyle.solid,
                      //         width: 2)),
                      labelText: "Email-Id",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white),
                    controller: phoneController,
                    decoration: InputDecoration(
                      // focusedBorder: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(10),
                      //     borderSide: BorderSide(
                      //         color: Colors.white,
                      //         style: BorderStyle.solid,
                      //         width: 4)),
                      // enabledBorder: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(10),
                      //     borderSide: BorderSide(
                      //         color: Colors.white,
                      //         style: BorderStyle.solid,
                      //         width: 2)),
                      labelText: "Phone Number",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: cityController,
                    decoration: InputDecoration(
                      // focusedBorder: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(10),
                      //     borderSide: BorderSide(
                      //         color: Colors.white,
                      //         style: BorderStyle.solid,
                      //         width: 4)),
                      // enabledBorder: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(10),
                      //     borderSide: BorderSide(
                      //         color: Colors.white,
                      //         style: BorderStyle.solid,
                      //         width: 2)),
                      labelText: "City",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: stateController,
                    decoration: InputDecoration(
                      // focusedBorder: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(10),
                      //     borderSide: BorderSide(
                      //         color: Colors.white,
                      //         style: BorderStyle.solid,
                      //         width: 4)),
                      // enabledBorder: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(10),
                      //     borderSide: BorderSide(
                      //         color: Colors.white,
                      //         style: BorderStyle.solid,
                      //         width: 2)),
                      labelText: "State",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: countryController,
                    decoration: InputDecoration(
                      // focusedBorder: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(10),
                      //     borderSide: BorderSide(
                      //         color: Colors.white,
                      //         style: BorderStyle.solid,
                      //         width: 4)),
                      // enabledBorder: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(10),
                      //     borderSide: BorderSide(
                      //         color: Colors.white,
                      //         style: BorderStyle.solid,
                      //         width: 2)),
                      labelText: "Country",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white),
                    obscureText: false,
                    controller: pinController,
                    decoration: InputDecoration(
                      // focusedBorder: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(10),
                      //     borderSide: BorderSide(
                      //         color: Colors.white,
                      //         style: BorderStyle.solid,
                      //         width: 4)),
                      // enabledBorder: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(10),
                      //     borderSide: BorderSide(
                      //         color: Colors.white,
                      //         style: BorderStyle.solid,
                      //         width: 2)),
                      labelText: "PIN Code",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                    controller: passController,
                    decoration: InputDecoration(
                      // focusedBorder: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(10),
                      //     borderSide: BorderSide(
                      //         color: Colors.white,
                      //         style: BorderStyle.solid,
                      //         width: 4)),
                      // enabledBorder: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(10),
                      //     borderSide: BorderSide(
                      //         color: Colors.white,
                      //         style: BorderStyle.solid,
                      //         width: 2)),
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'By continuing, I confirm that i have read & agree to the',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white60),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onLongPress: () {},
                        child: Text(
                          'Terms & Conditions',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  RaisedButton(
                    child: Text(
                      'Proceed',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 55, 80, 1),
                          fontSize: 20),
                    ),
                    padding: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0)),
                    color: Colors.white,
                    elevation: 0,
                    onPressed: () {
                      Future<String> status = makeNewUser();
                      status.then((value) {
                        if (value == "1") {
                          AlertDialog(
                            title: Text(
                              'User Created Successfully',
                              style: TextStyle(fontSize: 20),
                            ),
                          );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) {
                                    return login_page();
                                  },
                                  settings:
                                      RouteSettings(arguments: createMap())));
                        } else {
                          AlertDialog(
                            title: Text(
                              'User with same credentials already exists!',
                              style: TextStyle(fontSize: 20),
                            ),
                          );
                        }
                      });
                    },
                  ),
                  SizedBox(
                    height: 40,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
