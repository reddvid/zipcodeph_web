import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zipcodeph_web/constants.dart';
import 'package:zipcodeph_web/data/area_repository.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key, required this.area, required this.onTap});
  final String area;
  final Function(String province) onTap;
  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
// Get Provinces by Area
    List<String> menu = Areas().getPronvinces(area: widget.area);

    return ExpansionTile(
      title: Text(
        widget.area,
        overflow: TextOverflow.ellipsis,
        style: kAreaTextStyle,
      ),
      children: [
        ListView.builder(
          itemCount: menu.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                widget.onTap(menu[index]);
              },
              dense: true,
              title: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  menu[index],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              trailing: const Icon(Icons.chevron_right),
            );
          },
        )
      ],
    );
  }
}
