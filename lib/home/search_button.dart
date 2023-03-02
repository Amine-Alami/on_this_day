import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchButton extends StatefulWidget {
  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => GoRouter.of(context).go('/fetcher/test'),
        child: const Row(
          children: [
            Text("Search"),
            Icon(Icons.search)
          ],
        )
      );
  }
}
