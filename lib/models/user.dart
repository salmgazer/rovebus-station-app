class User {
  int id;
  String firstName;
  String lastName;
  String otherNames;
  String email;
  String phone;
  String countryName;
  String roles;
  String status;
  String community;
  bool confirmed;
  DateTime createdAt;
  DateTime updatedAt;

  User(
    this.id,
    this.firstName,
    this.lastName,
    this.otherNames,
    this.email,
    this.phone,
    this.countryName,
    this.roles,
    this.status,
    this.community,
    this.confirmed,
    this.createdAt,
    this.updatedAt,
  );

  User.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    firstName = map['firstName'];
    lastName = map['lastName'];
    otherNames = map['otherNames'];
    email = map['email'];
    phone = map['phone'];
    countryName = map['countryName'];
    roles = map['roles'];
    status = map['status'];
    community = map['community'];
    confirmed = (map['confirmed'] == 'false' ? false : true);
    this.createdAt = DateTime.parse(map['createdAt']);
    this.updatedAt = DateTime.parse(map['updatedAt']);
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>
    {
      "id": id.toString(),
      "firstName": firstName,
      "lastName": lastName,
      "otherNames": otherNames,
      "email": email,
      "phone": phone,
      "countryName": countryName,
      "roles": roles,
      "community": community,
      "status": status,
      "confirmed": confirmed,
      "createdAt": createdAt.toString(),
      "updatedAt": updatedAt.toString(),
    };
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User && runtimeType == other.runtimeType && firstName + " " + lastName == other.firstName + " " + other.lastName;

  @override
  int get hashCode => firstName.hashCode;
  
  @override
  String toString() {
    return firstName + " " + lastName;
  }

  String get phoneNumber {
    return phone;
  }

  static String tableName () => 'users';
}