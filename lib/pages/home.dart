import 'package:flutter/material.dart';
import 'package:patient_teledoc/auth_pages/login.dart';
import 'package:patient_teledoc/pages/vitals.dart';
import 'package:patient_teledoc/pageview/appointmentList.dart';
import 'package:patient_teledoc/pageview/newAppointmentList.dart';
import 'package:patient_teledoc/main.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  PageController pageController = PageController();
  TabController _tabController;
  int currentIndex = 0;
  var currentTab = [appointmentPage(), newAppointmentPage()];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  // PageStorageBucket _bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    var len = MediaQuery.of(context).size;

    return Scaffold(
        drawer: Container(
          width: MediaQuery.of(context).size.width,
          child: Drawer(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.blueAccent, Colors.blueGrey],
              )),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Back',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: len.width * 0.2,
                      backgroundImage: AssetImage('assets/images/doc.jpg'),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: Color.fromRGBO(0, 64, 93, 1),
                      padding: EdgeInsets.all(10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Center(
                          child: Text(
                            'My Profile',
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
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Under Construction !'),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        ));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: Color.fromRGBO(0, 64, 93, 1),
                      padding: EdgeInsets.all(10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Center(
                          child: Text(
                            'Chat Assistant',
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
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Under Construction !'),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        ));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: Color.fromRGBO(0, 64, 93, 1),
                      padding: EdgeInsets.all(10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Center(
                          child: Text(
                            'Diet Plans',
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
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Under Construction !'),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        ));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: Color.fromRGBO(0, 64, 93, 1),
                      padding: EdgeInsets.all(10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Center(
                          child: Text(
                            'Medication',
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
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Under Construction !'),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        ));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: Color.fromRGBO(0, 64, 93, 1),
                      padding: EdgeInsets.all(10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Center(
                          child: Text(
                            'Logout',
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
                        pref.remove('username');
                        //del_data('phone_num');
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return login_page();
                        }));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        appBar: GradientAppBar(
          iconTheme: IconThemeData(size: 50, color: Colors.white),
          actionsIconTheme: IconThemeData(size: 50, color: Colors.white),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.add_box,
                  //color: Colors.black,
                  size: 35,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) {
                            return vitalsPage();
                          },
                          fullscreenDialog: true));
                }),
            SizedBox(
              width: 10,
            )
          ],
          gradient: LinearGradient(colors: [
            Color.fromRGBO(0, 76, 113, 1),
            Color.fromRGBO(0, 55, 80, 1)
          ]),
          bottom: TabBar(
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                icon: Container(
                  child: Center(child: Text('Appointment')),
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 22, 32, 1),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Tab(
                icon: Container(
                  child: Center(child: Text('New Appointment')),
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 22, 32, 1),
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: currentTab,
          controller: _tabController,
        ));
  }
}
