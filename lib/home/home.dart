import 'package:flutter/material.dart';
import 'package:on_this_day/home/dropdown.dart';
import 'package:on_this_day/home/dropdown2.dart';
import 'package:on_this_day/home/datepicker.dart';

class Home extends StatelessWidget {
  Home({super.key});
  String? event;
  String? launge;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: Column(
        children: [
          Text(
            "sélectionner une date et un type pour savoir ce qui est passé a cette date",
            style: TextStyle(fontSize: 24),
          ),
          Padding(
            padding: EdgeInsets.all(32.0),
            child: Column(children: <Widget>[
              DatePicker(),
            ]),
          ),
          Padding(
            padding: EdgeInsets.all(32.0),
            child: Column(children: <Widget>[
              DropDown((value) => event = value),
            ]),
          ),
          Padding(
            padding: EdgeInsets.all(32.0),
            child: Column(children: <Widget>[
              DropDown2((value) => launge = value),
            ]),
          ),
          IconButton(
              onPressed: () => print(launge), icon: Icon(Icons.access_alarm))
        ],
      ),
    );
  }
}
