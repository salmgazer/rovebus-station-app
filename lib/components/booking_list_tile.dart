import 'package:flutter/material.dart';
import '../models/booking.dart';
import '../booking_page.dart';
import '../models/trip.dart';

class BookingListItem extends ListTile {

  BookingListItem(Booking booking, Trip trip, BuildContext context) :
    super(
      contentPadding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
      leading: CircleAvatar(
        backgroundColor: Colors.brown[400],
        child: Text(booking.passengerFirstName[0] + booking.passengerLastName[0], style: TextStyle(color: Colors.white)),
      ),
      title: Text(
        '${booking.passengerFirstName}   ${booking.passengerLastName}',
        style: TextStyle(color: Colors.grey[800]),
      ),

      subtitle: Row(
        children: <Widget>[
          Icon(Icons.location_on, color: Colors.grey[400]),
          Text('Seats: ${booking.numberOfSeats.toString()}    ${booking.bookingCode}', style: TextStyle(color: Colors.grey[700]))
        ],
      ),
      trailing:
        Icon(Icons.keyboard_arrow_right, color: Colors.grey, size: 30.0),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => BookingPage(booking, trip)));
        }
  );
}


final bookingCard = (BookingListItem tile) => Card(
  elevation: 2.0,
  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
  child: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    child: tile,
  ),
);