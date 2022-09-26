import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zipcodeph_web/components/side_menu.dart';
import 'package:zipcodeph_web/components/zipcode_list.dart';
import 'package:zipcodeph_web/constants.dart';
import 'package:zipcodeph_web/main.dart';
import 'package:zipcodeph_web/models/zipcode.dart';
import 'package:zipcodeph_web/services/zipcode_controller.dart';

import 'components/search_all_button.dart';
import 'components/search_list.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

List<String> areas = ["Metro Manila", "Luzon", "Visayas", "Mindanao"];

class _MainScreenState extends State<MainScreen> {
  int selectedValue = 0;
  bool isLargeScreen = false;

  @override
  void initState() {
    super.initState();

    // Load menu items
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: OrientationBuilder(builder: (context, orientation) {
        if (MediaQuery.of(context).size.width > 600) {
          isLargeScreen = true;
        } else {
          isLargeScreen = false;
        }

        return SafeArea(
          child: _HorizontalLayout(),
        );
      }),
    );
  }
}

class _HorizontalLayout extends StatefulWidget {
  @override
  State<_HorizontalLayout> createState() => _HorizontalLayoutState();
}

class _HorizontalLayoutState extends State<_HorizontalLayout> {
  String currentSelectedProvince = "Manila";
  final ZIPCodeController _zipCodeController = ZIPCodeController();
  bool isSearchOpen = true;

  @override
  Widget build(BuildContext context) {
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
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SearchAllButton(
                      onPressed: (value) {
                        setState(() {
                          isSearchOpen = value;
                        });
                      },
                    ),
                  ),
                  for (String area in areas)
                    SideMenu(
                      area: area,
                      onTap: (value) async {
                        setState(() {
                          currentSelectedProvince = value;
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

Widget _buildVerticalLayout() {
  return Container();
}
