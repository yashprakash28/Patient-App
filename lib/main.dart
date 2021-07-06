import 'package:flutter/material.dart';
import 'package:patient_teledoc/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'package:teledoc_admin/pages/patient_list.dart';
//import 'package:teledoc_admin/auth_pages/reg.dart';
import 'package:patient_teledoc/auth_pages/login.dart';

SharedPreferences pref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  pref = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: home(),
    );
  }
}

class home extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'teledoc',
        // theme: new ThemeData(),
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          scaffoldBackgroundColor: const Color.fromRGBO(0, 55, 80, 1),
          primarySwatch: Colors.blue,
        ),
        home: (pref.getString('username') == null) ? login_page() : HomePage()
        //getData('phone_number') == null ? login_page() : Pat_list(),
        );
  }
}
