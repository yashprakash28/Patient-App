import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:patient_teledoc/auth_pages/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:teledoc_admin/auth_pages/bankDetails.dart';

class vitalsPage extends StatefulWidget {
  vitalsPage({Key key}) : super(key: key);

  @override
  _vitalsPageState createState() => _vitalsPageState();
}

class _vitalsPageState extends State<vitalsPage> {
  var radConstant = 0.15;
  var rowSpacing = 40.00;
  var data = '1234';

  var receivedDataString;

  Future<Map<String, dynamic>> getBodyData() async {
    print("getting vitals");
    Uri uri = Uri.parse("http://54.162.56.164:5000/get");
    var params = {"id": "0909090909"};
    final newURI = uri.replace(queryParameters: params);
    http.Response receivedData =
        await http.get(newURI, headers: {"content-type": "application/json"});

    setState(() {
      receivedDataString = jsonDecode(receivedData.body);
    });
    print(receivedDataString);
    return receivedDataString;
  }

  @override
  Widget build(BuildContext context) {
    var len = MediaQuery.of(context).size;
    return Scaffold(
        body: FutureBuilder(
            future: getBodyData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: SpinKitRotatingCircle(
                      color: Colors.white,
                      size: 100.0,
                    ),
                  ),
                );
              }
              return Container(
                  height: MediaQuery.of(context).size.height * 1,
                  width: MediaQuery.of(context).size.width * 1,
                  color: Color.fromRGBO(0, 50, 71, 1),
                  child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[Colors.blueGrey, Colors.blueAccent],
                      )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: len.width * radConstant,
                                        backgroundImage: AssetImage(
                                            'assets/images/bloodGlucose.png'),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        'Blood Glucose: ${snapshot.data['Blood Glucose']}',
                                        // textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: rowSpacing,
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: len.width * radConstant,
                                        backgroundImage: AssetImage(
                                            'assets/images/bodyTemp.png'),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        'Temperature: ${snapshot.data['Body Temp']}',
                                        // textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: len.width * radConstant,
                                        backgroundImage: AssetImage(
                                            'assets/images/bodyWeight.png'),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        'Weight: ${snapshot.data['Body weight']}',
                                        // textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: rowSpacing,
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: len.width * radConstant,
                                        backgroundImage: AssetImage(
                                            'assets/images/heartRate.png'),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        'Heart Rate: ${snapshot.data['Pulse']}',
                                        // textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: len.width * radConstant,
                                        backgroundImage: AssetImage(
                                            'assets/images/respiration.png'),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        'Respiration: ${snapshot.data['Respiration Rate']}',
                                        // textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: rowSpacing,
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: len.width * radConstant,
                                        backgroundImage:
                                            AssetImage('assets/images/bp.png'),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        'Blood Pressure: ${snapshot.data['Blood Pressure']}',
                                        // textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )));
            }));
  }
}

//   GlobalKey<FormState> formkey = GlobalKey<FormState>();

//   Map createMap() {
//     Map<String, dynamic> userData = {
//       'User': '1',
//       'Patient_Id': phoneController.text,
//       'name': nameController.text,
//       'Age': ageController.text,
//       'email': emailController.text,
//       'phone': phoneController.text,
//       'pass': passController.text,
//       'city': cityController.text,
//       'state': stateController.text,
//       'country': countryController.text,
//       'PIN': pinController.text,
//     };
//     print(userData);
//     return userData;
//   }

//   Future<String> makeNewUser() async {
//     print("making new user");
//     // Map<String, dynamic> postData = {'username': '$username'};
//     Map<String, dynamic> postData = createMap();
//     http.Response check = await http.post('http://54.162.56.164:5000/signup',
//         body: jsonEncode(postData),
//         headers: {
//           "content-type": "application/json",
//           "Access-Control-Allow-Origin":
//               "*", // Required for CORS support to work
//           "Access-Control-Allow-Credentials":
//               "true", // Required for cookies, authorization headers with HTTPS
//           "Access-Control-Allow-Headers":
//               "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
//           "Access-Control-Allow-Methods": "POST, OPTIONS"
//         });
//     var statusData = jsonDecode(check.body);
//     print("fcscd" + statusData.toString());
//     return statusData.toString();
//   }

//   TextEditingController nameController,
//       ageController,
//       emailController,
//       phoneController,
//       cityController,
//       stateController,
//       countryController,
//       passController,
//       pinController;

//   void initState() {
//     super.initState();
//     nameController = TextEditingController();
//     ageController = TextEditingController();
//     emailController = TextEditingController();
//     phoneController = TextEditingController();
//     cityController = TextEditingController();
//     stateController = TextEditingController();
//     countryController = TextEditingController();
//     passController = TextEditingController();
//     pinController = TextEditingController();
//   }

//   void dispose() {
//     nameController.dispose();
//     ageController.dispose();
//     emailController.dispose();
//     phoneController.dispose();
//     cityController.dispose();
//     stateController.dispose();
//     countryController.dispose();
//     passController.dispose();
//     pinController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.all(15.0),
//         child: Center(
//           child: Form(
//               autovalidateMode: AutovalidateMode.always,
//               //autovalidate: true,
//               key: formkey,
//               child: ListView(
//                 children: <Widget>[
//                   // SizedBox(
//                   //   height: 60,
//                   // ),
//                   Text(
//                     'Create Profile',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     style: TextStyle(color: Colors.white),
//                     controller: nameController,
//                     decoration: InputDecoration(

//                         // focusedBorder: OutlineInputBorder(
//                         //     borderRadius: BorderRadius.circular(10),
//                         //     borderSide: BorderSide(
//                         //         color: Colors.white,
//                         //         style: BorderStyle.solid,
//                         //         width: 4)),
//                         // enabledBorder: OutlineInputBorder(
//                         //     borderRadius: BorderRadius.circular(10),
//                         //     borderSide: BorderSide(
//                         //         color: Colors.white,
//                         //         style: BorderStyle.solid,
//                         //         width: 2)),
//                         labelText: "Full Name",
//                         labelStyle: TextStyle(color: Colors.white)),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   TextFormField(
//                     keyboardType: TextInputType.number,
//                     style: TextStyle(color: Colors.white),
//                     controller: ageController,
//                     decoration: InputDecoration(
//                         // focusedBorder: OutlineInputBorder(
//                         //     borderRadius: BorderRadius.circular(10),
//                         //     borderSide: BorderSide(
//                         //         color: Colors.white,
//                         //         style: BorderStyle.solid,
//                         //         width: 4)),
//                         // enabledBorder: OutlineInputBorder(
//                         //     borderRadius: BorderRadius.circular(10),
//                         //     borderSide: BorderSide(
//                         //         color: Colors.white,
//                         //         style: BorderStyle.solid,
//                         //         width: 2)),
//                         labelText: "Age",
//                         labelStyle: TextStyle(color: Colors.white)),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   TextFormField(
//                     style: TextStyle(color: Colors.white),
//                     //initialValue: '+91',
//                     controller: emailController,
//                     keyboardType: TextInputType.emailAddress,
//                     decoration: InputDecoration(
//                         // focusedBorder: OutlineInputBorder(
//                         //     borderRadius: BorderRadius.circular(10),
//                         //     borderSide: BorderSide(
//                         //         color: Colors.white,
//                         //         style: BorderStyle.solid,
//                         //         width: 4)),
//                         // enabledBorder: OutlineInputBorder(
//                         //     borderRadius: BorderRadius.circular(10),
//                         //     borderSide: BorderSide(
//                         //         color: Colors.white,
//                         //         style: BorderStyle.solid,
//                         //         width: 2)),
//                         labelText: "Email-Id",
//                         labelStyle: TextStyle(color: Colors.white)),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   TextFormField(
//                     keyboardType: TextInputType.number,
//                     style: TextStyle(color: Colors.white),
//                     controller: phoneController,
//                     decoration: InputDecoration(
//                         // focusedBorder: OutlineInputBorder(
//                         //     borderRadius: BorderRadius.circular(10),
//                         //     borderSide: BorderSide(
//                         //         color: Colors.white,
//                         //         style: BorderStyle.solid,
//                         //         width: 4)),
//                         // enabledBorder: OutlineInputBorder(
//                         //     borderRadius: BorderRadius.circular(10),
//                         //     borderSide: BorderSide(
//                         //         color: Colors.white,
//                         //         style: BorderStyle.solid,
//                         //         width: 2)),
//                         labelText: "Phone Number",
//                         labelStyle: TextStyle(color: Colors.white)),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   TextFormField(
//                     style: TextStyle(color: Colors.white),
//                     controller: cityController,
//                     decoration: InputDecoration(
//                         // focusedBorder: OutlineInputBorder(
//                         //     borderRadius: BorderRadius.circular(10),
//                         //     borderSide: BorderSide(
//                         //         color: Colors.white,
//                         //         style: BorderStyle.solid,
//                         //         width: 4)),
//                         // enabledBorder: OutlineInputBorder(
//                         //     borderRadius: BorderRadius.circular(10),
//                         //     borderSide: BorderSide(
//                         //         color: Colors.white,
//                         //         style: BorderStyle.solid,
//                         //         width: 2)),
//                         labelText: "City",
//                         labelStyle: TextStyle(color: Colors.white)),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   TextFormField(
//                     style: TextStyle(color: Colors.white),
//                     controller: stateController,
//                     decoration: InputDecoration(
//                         // focusedBorder: OutlineInputBorder(
//                         //     borderRadius: BorderRadius.circular(10),
//                         //     borderSide: BorderSide(
//                         //         color: Colors.white,
//                         //         style: BorderStyle.solid,
//                         //         width: 4)),
//                         // enabledBorder: OutlineInputBorder(
//                         //     borderRadius: BorderRadius.circular(10),
//                         //     borderSide: BorderSide(
//                         //         color: Colors.white,
//                         //         style: BorderStyle.solid,
//                         //         width: 2)),
//                         labelText: "State",
//                         labelStyle: TextStyle(color: Colors.white)),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   TextFormField(
//                     style: TextStyle(color: Colors.white),
//                     controller: countryController,
//                     decoration: InputDecoration(
//                         // focusedBorder: OutlineInputBorder(
//                         //     borderRadius: BorderRadius.circular(10),
//                         //     borderSide: BorderSide(
//                         //         color: Colors.white,
//                         //         style: BorderStyle.solid,
//                         //         width: 4)),
//                         // enabledBorder: OutlineInputBorder(
//                         //     borderRadius: BorderRadius.circular(10),
//                         //     borderSide: BorderSide(
//                         //         color: Colors.white,
//                         //         style: BorderStyle.solid,
//                         //         width: 2)),
//                         labelText: "Country",
//                         labelStyle: TextStyle(color: Colors.white)),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   TextFormField(
//                     keyboardType: TextInputType.number,
//                     style: TextStyle(color: Colors.white),
//                     obscureText: false,
//                     controller: pinController,
//                     decoration: InputDecoration(
//                         // focusedBorder: OutlineInputBorder(
//                         //     borderRadius: BorderRadius.circular(10),
//                         //     borderSide: BorderSide(
//                         //         color: Colors.white,
//                         //         style: BorderStyle.solid,
//                         //         width: 4)),
//                         // enabledBorder: OutlineInputBorder(
//                         //     borderRadius: BorderRadius.circular(10),
//                         //     borderSide: BorderSide(
//                         //         color: Colors.white,
//                         //         style: BorderStyle.solid,
//                         //         width: 2)),
//                         labelText: "PIN Code",
//                         labelStyle: TextStyle(color: Colors.white)),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   TextFormField(
//                     style: TextStyle(color: Colors.white),
//                     obscureText: true,
//                     controller: passController,
//                     decoration: InputDecoration(
//                         // focusedBorder: OutlineInputBorder(
//                         //     borderRadius: BorderRadius.circular(10),
//                         //     borderSide: BorderSide(
//                         //         color: Colors.white,
//                         //         style: BorderStyle.solid,
//                         //         width: 4)),
//                         // enabledBorder: OutlineInputBorder(
//                         //     borderRadius: BorderRadius.circular(10),
//                         //     borderSide: BorderSide(
//                         //         color: Colors.white,
//                         //         style: BorderStyle.solid,
//                         //         width: 2)),
//                         labelText: "Password",
//                         labelStyle: TextStyle(color: Colors.white)),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Text(
//                     'By continuing, I confirm that i have read & agree to the',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(color: Colors.white60),
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       GestureDetector(
//                         onLongPress: () {},
//                         child: Text(
//                           'Terms & Conditions',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(color: Colors.blue),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 25,
//                   ),
//                   RaisedButton(
//                     child: Text(
//                       'Proceed',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Color.fromRGBO(0, 55, 80, 1),
//                           fontSize: 20),
//                     ),
//                     padding: EdgeInsets.all(15),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(40.0)),
//                     color: Colors.white,
//                     elevation: 0,
//                     onPressed: () {
//                       Future<String> status = makeNewUser();
//                       status.then((value) {
//                         if (value == "1") {
//                           AlertDialog(
//                             title: Text(
//                               'User Created Successfully',
//                               style: TextStyle(fontSize: 20),
//                             ),
//                           );
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) {
//                                     return login_page();
//                                   },
//                                   settings:
//                                       RouteSettings(arguments: createMap())));
//                         } else {
//                           AlertDialog(
//                             title: Text(
//                               'User with same credentials already exists!',
//                               style: TextStyle(fontSize: 20),
//                             ),
//                           );
//                         }
//                       });
//                     },
//                   ),
//                   SizedBox(
//                     height: 40,
//                   )
//                 ],
//               )),
//         ),
//       ),
//     );
//   }
// }
