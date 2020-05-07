class Booking {

  int id;
  String passengerFirstName;
  String passengerLastName;
  int numberOfSeats;
  String bookingCode;
  DateTime createdAt;
  DateTime updatedAt;

  Booking(this.id, this.passengerFirstName, this.passengerLastName, this.numberOfSeats, this.bookingCode, this.createdAt, this.updatedAt);

  Booking.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    passengerFirstName = map['passengerFirstName'];
    passengerLastName = map['passengerLastName'];
    numberOfSeats = int.parse(map['numberOfSeats']);
    bookingCode = map['bookingCode'];
    createdAt = DateTime.parse(map['createdAt']);
    updatedAt = DateTime.parse(map['updatedAt']);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Booking && runtimeType == other.runtimeType && bookingCode == other.bookingCode;

  @override
  int get hashCode => bookingCode.hashCode;
  
  @override
  String toString() {
    return bookingCode;
  }

  static String tableName = 'booking';
}
