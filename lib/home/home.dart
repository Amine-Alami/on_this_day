import 'package:flutter/material.dart';
import 'package:on_this_day/home/dropdown.dart';
import 'package:on_this_day/home/datepicker.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      
      padding: EdgeInsets.all(32.0),
      child: Column(
        children: [
          Container(
            child: const Text(
              "sélectionner une date et un type pour savoir ce qui est passé a cette date",
              style: TextStyle(fontSize: 24),
            ),
          ),

             Padding(
              padding: const EdgeInsets.all(32.0),
              child: Container(
              child: const Column(children: <Widget>[
                DatePicker(),
                
              ]
              ),
                      ),
            ),
        
          Padding(
            padding: const EdgeInsets.all(52.0),
            child: Container(
              child: const Column(children: <Widget>[
                DropDown(),
                
              ]
              ),
            ),
          ),

         
        ],
      ),
    );
  }
}
