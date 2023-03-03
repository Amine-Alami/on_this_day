import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class DropDown extends StatefulWidget {
  DropDown(this.onchanged, {super.key});
  void Function(String? value) onchanged;

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  final Map<String, String> items = {
      'Event':'events',
      'Holiday':'holidays',
      'Death':'deaths',
      'Birth':'births',
    };
  String? selectedValue;

  @override
  Widget build(BuildContext context) {

    return Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          hint: const Text(
            'Select type',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          items: items.entries
              .map((entry) => DropdownMenuItem<String>(
                    value: entry.value,
                    child: Text(
                      entry.key,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
            widget.onchanged(value);
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
