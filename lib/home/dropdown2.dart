import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class DropDown2 extends StatefulWidget {
   DropDown2(this.onchanged,{super.key});
   void Function(String? value) onchanged;

  @override
  State<DropDown2> createState() => _DropDown2State();
}

class _DropDown2State extends State<DropDown2> {
  final List<String> items = [
    'EN',
    'FR',
    'AR'
    
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          hint: const Text(
            'Choisir la langue',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              
            ),
          ),
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
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
