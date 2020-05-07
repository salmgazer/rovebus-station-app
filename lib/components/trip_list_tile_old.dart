import 'package:flutter/material.dart';
import 'package:gonow_bus_station/components/trip_list_item_old.dart';
import '../models/trip.dart';
import '../trip_page.dart';

class TripListTileOld extends ListTile {

  TripListTileOld(Trip trip, BuildContext context) :
      super(
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: CircleAvatar(
            backgroundColor: Colors.brown[400],
            child: Text(trip.departureStationName[0] + trip.arrivalStationName[0], style: TextStyle(color: Colors.white)),
          ),
          title: Text(
            '${trip.departureStationName}  to  ${trip.arrivalStationName}',
            style: TextStyle(color: Colors.grey[800]),
          ),

          subtitle: Row(
            children: <Widget>[
              Icon(Icons.location_on, color: Colors.grey[400]),
              Text('${trip.busNumber}    ${trip.departureTime}', style: TextStyle(color: Colors.grey[700]))
            ],
          ),
          trailing:
          Icon(Icons.keyboard_arrow_right, color: Colors.grey, size: 30.0),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => TripPage(trip)));
        }
    );
}


final tripCard = (TripListItemOld tile) => Card(
  elevation: 2.0,
  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
  child: Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    child: tile,
  ),
);
