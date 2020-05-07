import 'package:flutter/material.dart';
import '../trips_page.dart';
import '../login_page.dart';
import '../wallet_page.dart';
import '../history_page.dart';
import '../alerts_page.dart';
import '../settings_page.dart';
import '../app_state_container.dart';

class MyDrawer extends StatelessWidget {
  static final fontFamily = 'Montserrat';
  static final drawerHeaderTextStyleName = new TextStyle(color: Colors.white, fontSize: 20, fontFamily: fontFamily);
  static final drawerHeaderTextStylePhone = new TextStyle(color: Colors.white, fontFamily: fontFamily);

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {

    final AppStateContainerState inheritedWidget = AppStateContainer.of(context);

    return Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('VIP Bus Station', style: drawerHeaderTextStyleName),
              accountEmail: Text('0543344200', style: drawerHeaderTextStylePhone,),
              decoration: BoxDecoration(color: inheritedWidget.currentAppColor.value),
            ),
            ListTile(
              leading: Icon(Icons.local_shipping),
              title: Text('Trips', style: style),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(TripsPage.tag);
              },
            ),
            Divider(
              height: 2.0,
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('Wallet', style: style),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(WalletPage.tag);
              },
            ),
            Divider(
              height: 2.0,
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('History', style: style),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(HistoryPage.tag);
              },
            ),
            Divider(
              height: 2.0,
            ),
            ListTile(
              leading: Icon(Icons.add_alert),
              title: Text('Alerts', style: style),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(AlertsPage.tag);
              },
            ),
            Divider(
              height: 2.0,
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings', style: style),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(SettingsPage.tag);
              },
            ),
            Divider(
              height: 2.0,
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sign out', style: style),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(LoginPage.tag);
              },
            ),
            Divider(
              height: 2.0,
            ),
          ],
        ),
      );
    }
  }
