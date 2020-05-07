import 'package:flutter/material.dart';
import 'package:gonow_bus_station/components/alert_list_item.dart';
import 'package:gonow_bus_station/models/alert.dart';
import 'app_state_container.dart';



class AlertsPage extends StatelessWidget {

  static String tag = 'alerts-page';

  List<Alert> alerts = <Alert>[
    new Alert(1, 'booking','Akua Johnson has booked 1 seat on the Kumasi 5pm trip. 5 seats left', DateTime(2019), DateTime(2019)),
    new Alert(1, 'booking','Ama Bonsu has booked for 2 seats the Kumasi 5pm trip. 3 seats left', DateTime(2019), DateTime(2019)),
    new Alert(1, 'booking','Fred Abochi has booked for 2 seats the Kumasi 5pm trip. 1 seats left', DateTime(2019), DateTime(2019)),
    new Alert(1, 'Update','Please update the app by end of day tomorrow', DateTime(2019), DateTime(2019)),
  ];


  List<AlertListItem> _buildAlertList(BuildContext context) {
    return this.alerts.map((alert) => AlertListItem(alert, context)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final AppStateContainerState inheritedWidget = AppStateContainer.of(context);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Alerts',
        style: new TextStyle(color: Colors.white)),
        backgroundColor: inheritedWidget.currentAppColor.value,
        iconTheme: new IconThemeData(color: Colors.white)
      ),
      body:
        ListView(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          children: _buildAlertList(context)
        )
    );
  }
}
