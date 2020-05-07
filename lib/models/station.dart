class Station {

  int id;
  String name;
  String stationGps;
  String town;
  DateTime createdAt;
  DateTime updatedAt;

  Station(this.id, this.name, this.stationGps, this.town, this.createdAt, this.updatedAt);

  Station.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    name = map['name'];
    stationGps = map['stationGps'];
    town = map['town'];
    createdAt = DateTime.parse(map['createdAt']);
    updatedAt = DateTime.parse(map['updatedAt']);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Station && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;
  
  @override
  String toString() {
    return name;
  }

  static String tableName = 'stations';
}
