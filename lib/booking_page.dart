import 'package:flutter/material.dart';
import 'package:gonow_bus_station/models/trip.dart';
import 'models/booking.dart';
import 'app_state_container.dart';


class BookingPage extends StatelessWidget {
  static String tag = 'booking-page';
  final Booking booking;
  final Trip trip;
  const BookingPage(this.booking, this.trip);

  final boxHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    final AppStateContainerState inheritedWidget = AppStateContainer.of(context);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('${booking.passengerFirstName} boards to ${trip.arrivalStationName}' , style: new TextStyle(color: Colors.white)),
        backgroundColor: inheritedWidget.currentAppColor.value,
        iconTheme: new IconThemeData(color: Colors.white)
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        children: [
           ListTile(
            title: Text('First name: ' + booking.passengerFirstName),
          ),
          Divider(color: Colors.grey),
           ListTile(
            title: Text('Last name: ' + booking.passengerLastName),
          ),
          Divider(color: Colors.grey),
          ListTile(
            title: Text('Booking code: ' + booking.bookingCode),
          ),
          Divider(color: Colors.grey),
          ListTile(
            title: Text('Number of seats: ' + booking.numberOfSeats.toString()),
          ),
          Divider(color: Colors.grey),
          ListTile(
            title: Text('Created on: ' + booking.createdAt.toString()),
          ),
          Divider(color: Colors.grey),
          ListTile(
            title: Text('Last updated: ' + booking.updatedAt.toString()),
          ),
          Divider(color: Colors.grey),
        ],
      )
    );
  }

}
