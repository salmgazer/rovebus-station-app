import 'package:flutter/material.dart';
import 'package:gonow_bus_station/alerts_page.dart';
import 'package:gonow_bus_station/history_page.dart';
import 'package:gonow_bus_station/settings_page.dart';
import 'package:gonow_bus_station/trips_page.dart';
import 'package:gonow_bus_station/wallet_page.dart';
import 'login_page.dart';
import 'app_state_container.dart';


void main() => runApp( new AppStateContainer(
  child: MyApp()
));

class MyApp extends StatelessWidget {

  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => new LoginPage(),
    HistoryPage.tag: (context) => new HistoryPage(),
    AlertsPage.tag: (context) => new AlertsPage(),
    WalletPage.tag: (context) => new WalletPage(),
    TripsPage.tag: (context) => new TripsPage(),
    SettingsPage.tag: (context) => new SettingsPage()
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final AppStateContainerState inheritedWidget = AppStateContainer.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gonow Bus Station',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.,
        primarySwatch: inheritedWidget.currentAppColor.value
      ),
      home: LoginPage(title: 'Login'),
      routes: routes,
    );
  }
}