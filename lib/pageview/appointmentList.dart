import 'package:flutter/material.dart';
import 'package:patient_teledoc/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class appointmentPage extends StatefulWidget {
  appointmentPage({Key key}) : super(key: key);

  @override
  _appointmentPageState createState() => _appointmentPageState();
}

class _appointmentPageState extends State<appointmentPage>
    with AutomaticKeepAliveClientMixin {
  ScrollController scroller = ScrollController();

  Future<dynamic> get_appointment_list() async {
    Map data = {"clinic_id": "1234"};
    http.Response response = await http.post(
        'http://54.87.169.52:5000/patient_clinic_details',
        body: jsonEncode(data),
        headers: {"content-type": "application/json"});
    // if (response.statusCode == 201) {
    //   print(jsonDecode(response.body));
    //   return jsonDecode(response.body);
    // } else {
    //   throw Exception('failed to upload data');
    // }
    var list = jsonDecode(response.body);
    print(list['result']);
    return list['result'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      color: Color.fromRGBO(0, 50, 71, 1),
      child: FutureBuilder(
        future: get_appointment_list(),
        //initialData: Text('loading....'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return
                // Container(
                //   height: MediaQuery.of(context).size.height*0.5,
                //   width: MediaQuery.of(context).size.width*1,
                //   color: Color.fromRGBO(0, 50, 71, 1),
                //   child:
                Text(
              'No appointment booked yet. Book new appointment in New Appointment section.',
              style: TextStyle(color: Colors.white),
            )
                //)
                ;
          }
          return ListView.builder(
              padding: EdgeInsets.only(top: 4),
              controller: scroller,
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ListTile(
                      tileColor: Colors.white,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) {},
                                settings: RouteSettings(arguments: {
                                  "doctor_Id": "${snapshot.data[index][0]}",
                                  "patient_Id": "${snapshot.data[index][1]}"
                                })));
                      },
                      title: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text('${snapshot.data[index][9]}'),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                            'Expected Arrival today ${snapshot.data[index][6]}'),
                      ),
                      trailing: Column(
                        children: [],
                      )),
                );
              });
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
