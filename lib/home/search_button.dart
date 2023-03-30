import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchButton extends StatefulWidget {
  SearchButton(
      {super.key,
      required this.langue,
      required this.type,
      required this.date});
  String? type;
  String? langue;
  DateTime? date;

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 150,
      child: ElevatedButton(
          style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.brown)),
          onPressed: () {
            // print(widget.langue);
            // print(widget.type);
            // print(widget.date);

            GoRouter.of(context).go('/eventsList/'
                '${widget.langue}/'
                '${widget.type}/'
                '${widget.date!.day.toString().padLeft(2, "0")}/'
                '${widget.date!.month.toString().padLeft(2, "0")}/');
          },
          child: const Text(
            "Show me what happened",
            style: TextStyle(fontSize: 15, color: Colors.white),
            textAlign: TextAlign.center,
          )),
    );
  }
}
