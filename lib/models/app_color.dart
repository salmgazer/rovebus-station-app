import 'package:flutter/material.dart';

class AppColor {

  int id;
  String name;
  MaterialColor value;

  AppColor(this.id, this.name, this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppColor && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;
  
  @override
  String toString() {
    return name;
  }

  static String tableName = 'appcolors';
}
