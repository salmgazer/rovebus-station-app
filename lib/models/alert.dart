class Alert {

  int id;
  String type;
  String message;
  DateTime createdAt;
  DateTime updatedAt;

  Alert(this.id, this.type, this.message, this.createdAt, this.updatedAt);

  Alert.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.message = map['message'];
    this.type = map['type'];
    createdAt = DateTime.parse(map['createdAt']);
    updatedAt = DateTime.parse(map['updatedAt']);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Alert && runtimeType == other.runtimeType && message == other.message;

  @override
  int get hashCode => message.hashCode;
  
  @override
  String toString() {
    return message;
  }

  static String tableName = 'alerts';
}
