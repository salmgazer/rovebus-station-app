import 'package:flutter/material.dart';
import 'package:gonow_bus_station/models/alert.dart';


class AlertListItem extends ListTile {

  AlertListItem(Alert alert, BuildContext context) :
    super(
      title : Text(alert.message, style: TextStyle(fontSize: 15),),
      subtitle: Text('Type: ${alert.type}   On: ${alert.createdAt}', style: TextStyle(fontSize: 15),),
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) => BookingPage(booking, trip)));
      },
    );
}