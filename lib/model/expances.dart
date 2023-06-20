import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
var format = DateFormat.yMd();

enum Catagory { food, travel, leisure, work }

const catagorylist = {
  Catagory.food: Icons.food_bank,
  Catagory.leisure: Icons.business,
  Catagory.travel: Icons.flight_land_outlined,
  Catagory.work: Icons.luggage_rounded,
};

class Expances {
  Expances(
      {required this.title,
      required this.amount,
      required this.catagory,
      required this.date})
      : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Catagory catagory;
  get setdate {
    return format.format(date);
  }
}
