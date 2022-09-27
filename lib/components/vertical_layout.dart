import 'package:flutter/material.dart';

import '../services/zipcode_controller.dart';
import '../zipcodeph.dart';
import 'search_list.dart';
import 'zipcode_list.dart';

class VerticalLayout extends StatefulWidget {
  const VerticalLayout({super.key, required this.isSearchOpen});
  final bool isSearchOpen;

  @override
  State<VerticalLayout> createState() => VerticalLayoutState();
}

class VerticalLayoutState extends State<VerticalLayout> {
  final ZIPCodeController _zipCodeController = ZIPCodeController();

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      child: Column(
        children: [
          widget.isSearchOpen
              ? SearchAllList(
                  zipCodeController: _zipCodeController,
                  onPressed: () {
                    setState(() {
                      !widget.isSearchOpen;
                    });
                  })
              : ZIPCodeList(
                  zipCodeController: _zipCodeController,
                  currentSelectedProvince: currentSelectedProvince,
                ),
        ],
      ),
    );
  }
}
