import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchButton extends StatefulWidget {
  const SearchButton({super.key});

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
          onPressed: () => GoRouter.of(context).go('/events/params'),
          child: const Flexible(
            child: 
              Text(
                "Show me what happened",
                style: TextStyle(fontSize: 15, color: Colors.green),
                textAlign: TextAlign.center,
              ) 
            
          )),
    );
  }
}
