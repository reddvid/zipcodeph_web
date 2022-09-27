import 'package:flutter/material.dart';
import 'package:zipcodeph_web/components/download_button.dart';
import 'package:zipcodeph_web/components/side_menu.dart';

import '../services/zipcode_controller.dart';
import '../zipcodeph.dart';
import 'search_all_button.dart';
import 'search_list.dart';
import 'vertical_layout.dart';
import 'zipcode_list.dart';

class HorizontalLayout extends StatefulWidget {
  const HorizontalLayout({super.key, required this.isSearchOpen});
  final bool isSearchOpen;

  @override
  State<HorizontalLayout> createState() => HorizontalLayoutState();
}

class HorizontalLayoutState extends State<HorizontalLayout> {
  String currentSelectedProvince = "Manila";
  final ZIPCodeController _zipCodeController = ZIPCodeController();
  late bool isSearchOpen;

  @override
  void initState() {
    super.initState();
    isSearchOpen = widget.isSearchOpen;
    print("Init state: $isSearchOpen");
  }

  @override
  void deactivate() {
    super.deactivate();
    isSearchOpen = false;
  }

  @override
  Widget build(BuildContext context) {
    print("Build horizontal: $isSearchOpen");

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 20.0, 20.0, 80.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: DownloadButton(),
                  ),
                  for (String area in areas)
                    SideMenu(
                      area: area,
                      onTap: (value) {
                        setState(() {
                          currentSelectedProvince = value;
                          isSearchOpen = false;
                        });
                      },
                    ),
                ],
              ),
            ),
          ),
        ),
        Visibility(
          visible: isSearchOpen,
          child: SearchAllList(
            zipCodeController: _zipCodeController,
            onPressed: () {
              setState(() {
                isSearchOpen = false;
              });
            },
          ),
        ),
        Visibility(
          visible: !isSearchOpen,
          child: ZIPCodeList(
              zipCodeController: _zipCodeController,
              currentSelectedProvince: currentSelectedProvince),
        ),
      ],
    );
  }
}
