import 'package:flutter/material.dart';
import '../models/alert.dart';

class AlertListTile extends ListTile {

  AlertListTile(Alert alert, BuildContext context) :
    super(
      contentPadding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
      title: Text(
        '${alert.message}',
        style: TextStyle(color: Colors.grey[800], fontSize: 12),
      ),

      subtitle: Row(
        children: <Widget>[
          Icon(Icons.location_on, color: Colors.grey[400]),
          Text('Type: ${alert.type}    ${alert.createdAt}', style: TextStyle(color: Colors.grey[700]))
        ],
      ),
      trailing:
        Icon(Icons.keyboard_arrow_right, color: Colors.grey, size: 30.0),
        onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => BookingPage(booking, trip)));
        }
  );
}


final alertCard = (AlertListTile tile) => Card(
  elevation: 2.0,
  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
  child: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    child: tile,
  ),
);