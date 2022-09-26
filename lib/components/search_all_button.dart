import 'package:flutter/material.dart';

class SearchAllButton extends StatelessWidget {
  const SearchAllButton({Key? key, required this.onPressed}) : super(key: key);

  final Function(bool isSearchOpen) onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        onPressed(true);
      },
      icon: const Icon(
        Icons.search,
        size: 24.0,
      ),
      label: const SizedBox(
          height: 48.0,
          child: Align(
              alignment: Alignment.center, child: Text("Search ZIP codes"))),
    );
  }
}
