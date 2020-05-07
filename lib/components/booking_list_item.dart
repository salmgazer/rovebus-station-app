import 'package:flutter/material.dart';
import '../models/booking.dart';
import '../booking_page.dart';
import '../models/trip.dart';


class BookingListItem extends ListTile {

  BookingListItem(Booking booking, Trip trip, BuildContext context) :
    super(
      title : Text(booking.passengerFirstName + " " + booking.passengerLastName, style: TextStyle(fontSize: 20),),
      subtitle: Text('Seats: ${booking.numberOfSeats}   Code: ${booking.bookingCode}', style: TextStyle(fontSize: 15),),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => BookingPage(booking, trip)));
      },
      leading: CircleAvatar(
        backgroundColor: Colors.grey,
        child: Text(booking.passengerFirstName[0] + booking.passengerLastName[0], style: TextStyle(color: Colors.white)),
      ),
      trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.grey, size: 30.0),
    );
}