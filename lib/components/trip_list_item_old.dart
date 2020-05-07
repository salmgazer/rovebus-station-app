import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../trip_page.dart';


class TripListItemOld extends ListTile {


  TripListItemOld(Trip trip, BuildContext context) :
    super(
      title : Text(trip.arrivalStationName, style: TextStyle(fontSize: 20),),
      subtitle: Text('Time: ${trip.departureTime.hour}:${trip.departureTime.minute} am     Seats left: 0', style: TextStyle(color: Colors.brown[400], fontSize: 15)),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => TripPage(trip)));
      },
      leading: CircleAvatar(
        backgroundColor: Colors.grey,
        child: Text(trip.departureStationName[0] + trip.arrivalStationName[0], style: TextStyle(color: Colors.white)),
      ),
      trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.grey, size: 30.0),
    );


}
