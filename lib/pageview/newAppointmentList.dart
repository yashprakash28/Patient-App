import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class newAppointmentPage extends StatefulWidget {
  newAppointmentPage({Key key}) : super(key: key);

  @override
  _newAppointmentPageState createState() => _newAppointmentPageState();
}

// var numberOfDoctors = 20;
var radConstant = 0.15;
var doctorsList;
var numberOfDoctorsAvailable;

class _newAppointmentPageState extends State<newAppointmentPage> {
  Future<List<dynamic>> getDoctorsList() async {
    Map<String, String> postData = {'location': 'India'};
    http.Response check = await http.post(
        'http://54.162.56.164:5000//appointmentAvailability',
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
    doctorsList = jsonDecode(check.body)['result'];
    numberOfDoctorsAvailable = doctorsList.length;
    print(numberOfDoctorsAvailable);

    return doctorsList;
  }

  @override
  Widget build(BuildContext context) {
    var rowSpacing = 30.0;
    var nameFontSize = 20.0;
    var phoneFontSize = 15.0;
    var locationFontSize = 10.0;
    var emailFontSize = 12.0;

    return Scaffold(
      body: FutureBuilder(
        future: getDoctorsList(),
        // initialData: InitialData,
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
          return ListView.builder(
            itemExtent: 120.0,
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              var len = MediaQuery.of(context).size;
              return Padding(
                  padding: EdgeInsets.all(8),
                  child: RaisedButton(
                      color: Colors.lightBlue[800 + (100 * (index % 2))],
                      padding: EdgeInsets.all(10),
                      child: Row(children: [
                        SizedBox(
                          width: 10,
                        ),
                        // image and likes
                        Column(
                          children: [
                            CircleAvatar(
                              radius: (len.width * radConstant) * 0.6,
                              backgroundImage:
                                  AssetImage('assets/images/doc.jpg'),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: rowSpacing,
                        ),
                        // rest of data
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //name
                            Text(
                              "Dr. ${snapshot.data[index][1]}",
                              style: TextStyle(
                                  fontSize: nameFontSize,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            // phone
                            Text(
                              "+91 ${snapshot.data[index][4]}",
                              style: TextStyle(
                                  fontSize: phoneFontSize,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                            ),
                            // location (city and state)
                            Text(
                              "${snapshot.data[index][6]}, ${snapshot.data[index][7]}",
                              style: TextStyle(
                                  fontSize: locationFontSize,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                            ),
                            // email
                            Text(
                              "${snapshot.data[index][3]}",
                              style: TextStyle(
                                  fontSize: emailFontSize,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                      ]),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      onPressed: () {
                        print('working');
                        bookAppointment(context);
                      }));
            },
          );
        },
      ),
    );
  }

  Future<String> bookAppointment(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Confirm Appointment"),
      content: Text("Press confirm to book your appointment"),
      actions: <Widget>[
        MaterialButton(
          elevation: 5.0,
          child: Text("Confirm"),
          onPressed: () {
            // sendDataToApi();
            Navigator.of(context).pop('Appointment Confirmed');
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Appointment Booked'),
            ));
          },
        ),
        MaterialButton(
          elevation: 5.0,
          child: Text("I pressed accidentally."),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }
}
