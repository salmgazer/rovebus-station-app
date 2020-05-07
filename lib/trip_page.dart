import 'package:flutter/material.dart';
import 'package:gonow_bus_station/components/booking_list_item.dart';
import 'package:gonow_bus_station/models/booking.dart';
import 'app_state_container.dart';
import 'models/trip.dart';



class TripPage extends StatelessWidget {

  static String tag = 'trip-page';
  final Trip trip;

  TripPage(this.trip);

  List<Booking> bookings = <Booking>[
    new Booking(1, 'Salifu', 'Mutaru', 3, '#5323AB', DateTime(2019), DateTime(2019)),
    new Booking(1, 'Aku', 'Mensah', 1, '#5323GH', DateTime(2019), DateTime(2019)),
    new Booking(1, 'Aminu', 'Bombo', 2, '#5323OP', DateTime(2019), DateTime(2019)),
    new Booking(1, 'Samuel', 'Alomenu', 1, '#5323VQ', DateTime(2019), DateTime(2019)),
    new Booking(1, 'Youssouf', 'Dasilva', 1, '#5323UI', DateTime(2019), DateTime(2019)),
  ];


  List<BookingListItem> _buildBookingList(BuildContext context) {
    return this.bookings.map((booking) => BookingListItem(booking, trip, context)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final AppStateContainerState inheritedWidget = AppStateContainer.of(context);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Passengers going to ${trip.arrivalStationName}',
        style: new TextStyle(color: Colors.white)),
        backgroundColor: inheritedWidget.currentAppColor.value,
        iconTheme: new IconThemeData(color: Colors.white)
      ),
      body:
        ListView(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          children: _buildBookingList(context)
        )
    );
  }
}
