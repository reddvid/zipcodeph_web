import 'package:flutter/material.dart';
import 'package:zipcodeph_web/components/download_button.dart';
import 'package:zipcodeph_web/components/horizontal_layout.dart';
import 'package:zipcodeph_web/components/side_menu.dart';
import 'package:zipcodeph_web/components/vertical_layout.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

String currentSelectedProvince = "Manila";

List<String> areas = ["Metro Manila", "Luzon", "Visayas", "Mindanao"];

class _MainScreenState extends State<MainScreen> {
  int selectedValue = 0;
  bool isLargeScreen = false;

  late bool isSearchOpen;

  @override
  void initState() {
    super.initState();

    setState(() {
      isSearchOpen = false;
    });
    // Load menu items
    currentSelectedProvince = "Manila";
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 600) {
      isLargeScreen = true;
    } else {
      isLargeScreen = false;
    }

    return OrientationBuilder(
      builder: ((context, orientation) {
        if (MediaQuery.of(context).size.width > 720) {
          isLargeScreen = true;
        } else {
          isLargeScreen = false;
        }

        return Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "icon_nopad.png",
                  height: 32.0,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                const Text(
                  "ZIP Code PH",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isSearchOpen = !isSearchOpen;
                    print("Button pressed $isSearchOpen");
                  });
                },
                icon: isSearchOpen
                    ? const Icon(Icons.close)
                    : const Icon(Icons.search),
              )
            ],
          ),
          drawer: isLargeScreen
              ? null
              : Drawer(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 80.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: DownloadButton(),
                          ),
                          const SizedBox(height: 20.0),
                          for (String area in areas)
                            SideMenu(
                              area: area,
                              onTap: (value) async {
                                setState(() {
                                  currentSelectedProvince = value;
                                  isSearchOpen = false;
                                });
                                Navigator.of(context).pop();
                              },
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
          body: SafeArea(
            child: isLargeScreen
                ? HorizontalLayout(
                    isSearchOpen: isSearchOpen,
                    key: ValueKey<bool>(isSearchOpen),
                  )
                : VerticalLayout(
                    isSearchOpen: isSearchOpen,
                    key: ValueKey<bool>(isSearchOpen),
                  ),
          ),
        );
      }),
    );
  }
}
