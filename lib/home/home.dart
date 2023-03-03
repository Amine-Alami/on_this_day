import 'package:flutter/material.dart';
import 'package:on_this_day/home/dropdown.dart';
import 'package:on_this_day/home/dropdown2.dart';
import 'package:on_this_day/home/datepicker.dart';
import 'package:on_this_day/home/search_button.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? type;
  String? langue;
  DateTime? date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(30),
        width: double.maxFinite,
        child: Card(
            elevation: 5,
            color: Colors.white,
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: ListView(
                  children: [
                    const Text(
                      "Please select a date and an event type "
                      "to list what has happened on that day",
                      style: TextStyle(fontSize: 19),
                      textAlign: TextAlign.center,
                    ),
                     Padding(
                      padding: const EdgeInsets.fromLTRB(0, 60, 0, 10),
                      child: Column(children: <Widget>[
                        DatePicker((value) => setState(() {
                          date = value;
                        }), date!),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                      child: Column(children: <Widget>[
                        DropDown((value) => setState(() {
                          type = value;
                        })),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: Column(children: <Widget>[
                        DropDown2((value) => setState(() {
                          langue = value;
                        })),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                      child: SearchButton(langue: langue, type: type, date: date),
                    )
                  ],
                ))));
  }
}
