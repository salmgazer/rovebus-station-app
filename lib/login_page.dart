import 'package:flutter/material.dart';
import 'package:gonow_bus_station/trips_page.dart';
import 'package:gonow_bus_station/app_state_container.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  static String tag = 'login-page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {

    final AppStateContainerState inheritedWidget = AppStateContainer.of(context);
    /*
    if (inheritedWidget.currentAppColor == null) {
      inheritedWidget.saveAppColor(inheritedWidget.appColors[0]);
    }*/
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    final stationCodeField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Station Code",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: inheritedWidget.currentAppColor.value,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(TripsPage.tag);
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
      child: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 90.0),
                SizedBox(
                  child: Text("RoveBUS", 
                    textAlign: TextAlign.center,
                    style: style.copyWith(
                      color: inheritedWidget.currentAppColor.value,
                      fontWeight: FontWeight.bold,
                      fontSize: 60
                    ),
                  )
                ),
                SizedBox(
                  child: Text("Manage trips", 
                    textAlign: TextAlign.center,
                    style: style.copyWith(
                      color: inheritedWidget.currentAppColor.value,
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    ),
                  )
                ),
                SizedBox(height: 70.0),
                stationCodeField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(
                  height: 35.0,
                ),
                loginButon,
              ],
            ),
          ),
        ),
      ),
        )
    );
  }
}
