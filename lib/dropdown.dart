import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DatePickerState();
}

class _DatePickerState extends State<DropDown> {
  final List<String> items = [
    'Event',
    'Birth',
    'Deth',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          hint: Text(
            'Select Type',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as String;
            });
          },
          buttonStyleData: const ButtonStyleData(
            height: 40,
            width: 140,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
        ),
      ),
    );
  }
}
