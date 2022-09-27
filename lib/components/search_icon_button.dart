import 'package:flutter/material.dart';

class SearchIconButton extends StatelessWidget {
  const SearchIconButton({super.key, required this.onPressed});
  final Function(bool isOpen) onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed(true),
      icon: const Icon(
        Icons.search,
      ),
    );
  }
}
