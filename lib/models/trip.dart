class Trip {

  int id;
  double cost;
  String busNumber;
  String departureStationName;
  String arrivalStationName;
  DateTime departureTime;
  DateTime arrivalTime;
  DateTime createdAt;
  DateTime updatedAt;

  Trip(this.id, this.cost, this.busNumber, this.departureStationName, this.arrivalStationName, this.departureTime, this.arrivalTime, this.createdAt, this.updatedAt);

  Trip.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    cost = map['cost'];
    busNumber = map['busNumber'];
    departureStationName = map['departureStationName'];
    arrivalStationName = map['arrivalStationName'];
    departureTime = DateTime.parse(map['departureTime']);
    arrivalTime = DateTime.parse(map['arrivalTime']);
    createdAt = DateTime.parse(map['createdAt']);
    updatedAt = DateTime.parse(map['updatedAt']);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Trip && runtimeType == other.runtimeType && busNumber == other.busNumber;

  @override
  int get hashCode => busNumber.hashCode;
  
  @override
  String toString() {
    return busNumber;
  }

  static String tableName = 'trips';
}
