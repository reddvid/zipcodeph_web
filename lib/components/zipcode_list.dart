import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/zipcode.dart';
import '../services/zipcode_controller.dart';

class ZIPCodeList extends StatefulWidget {
  const ZIPCodeList({
    Key? key,
    required ZIPCodeController zipCodeController,
    required this.currentSelectedProvince,
  })  : _zipCodeController = zipCodeController,
        super(key: key);

  final ZIPCodeController _zipCodeController;
  final String currentSelectedProvince;

  @override
  State<ZIPCodeList> createState() => _ZIPCodeListState();
}

class _ZIPCodeListState extends State<ZIPCodeList> {
  List<ZIPCodeModel> zipCodes = [];

  @override
  void initState() {
    super.initState();
    setState(() {});
    // loadAllZipCodes();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future:
          widget._zipCodeController.getZipCodes(widget.currentSelectedProvince),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Expanded(
            flex: 3,
            child: Center(
              child: Text(
                widget.currentSelectedProvince,
                style: kProvinceTitleStyle,
              ),
            ),
          );
        } else {
          return Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
              child: Column(
                children: [
                  Text(
                    widget.currentSelectedProvince,
                    style: kProvinceTitleStyle,
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 80.0),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => const Divider(
                        height: 0.0,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var zipCode = snapshot.data![index];
                        return ListTile(
                            onLongPress: () {
                              // showModalBottomSheet<void>(
                              //     context: context,
                              //     builder: (BuildContext context) {
                              //       return bottomSheet(
                              //           context, snapshot.data![index], _refreshList);
                              //     });
                            },
                            onTap: () {
                              // showModalBottomSheet<void>(
                              //     context: context,
                              //     builder: (BuildContext context) {
                              //       return bottomSheet(
                              //           context, snapshot.data![index], _refreshList);
                              //     });
                            },
                            visualDensity:
                                const VisualDensity(vertical: -4), // to compact
                            leading: Container(
                                width: 48,
                                height: double.infinity,
                                alignment: Alignment.center,
                                child: Text(
                                  zipCode['code'].toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )),
                            subtitle: Text(zipCode['area'] as String),
                            title: Text(zipCode['town'] as String));
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
