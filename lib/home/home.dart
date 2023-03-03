import 'package:flutter/material.dart';
import 'package:on_this_day/home/dropdown.dart';
import 'package:on_this_day/home/dropdown2.dart';
import 'package:on_this_day/home/datepicker.dart';
import 'package:on_this_day/home/search_button.dart';

class Home extends StatelessWidget {
  Home({super.key});
  String? event;
  String? launge;

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
                child: Column(
                  children: [
                    const Text(
                      "Veuillez sélectionner une date et un type "
                      "pour savoir ce qui était passé a cette date",
                      style: TextStyle(fontSize: 19),
                      textAlign: TextAlign.center,
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0,70,0,0),
                      child: Column(children: <Widget>[
                        DatePicker(),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(52.0),
                      child: Column(children: <Widget>[
                        DropDown((value) => event = value),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(52.0),
                      child: Column(children: <Widget>[
                        DropDown2((value) => launge = value),
                      ]),
                    ),
                    const SearchButton()
                    // onPressed: () => print(launge), icon: Icon(Icons.access_alarm)
                  ],
                )
            )
        )
    );
  }
}
