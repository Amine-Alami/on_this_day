import 'dart:async';

import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  DatePicker(this.onchanged, this.date, {super.key});
  void Function(DateTime? value) onchanged;
  DateTime date;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.date;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2022),
        lastDate: DateTime(2024));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.onchanged(selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "${selectedDate.toLocal().day.toString().padLeft(2, "0")} / "
            "${selectedDate.toLocal().month.toString().padLeft(2, "0")}",
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 5,
          ),
          ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.white)),
            onPressed: () => _selectDate(context),
            child: const Text('Pick a date',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                )),
          ),
        ],
      ),
    );
  }
}
