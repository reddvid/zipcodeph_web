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
  String query = "";

  @override
  void initState() {
    super.initState();
    setState(() {});
    // loadAllZipCodes();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: widget._zipCodeController.findInProvince(
          query,
          widget
              .currentSelectedProvince), //.find(widget.currentSelectedProvince),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Expanded(
            flex: 3,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(height: 20.0),
                  Text("Loading..."),
                ],
              ),
            ),
          );
        } else {
          return Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    widget.currentSelectedProvince,
                    style: kProvinceTitleStyle,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      onSubmitted: (value) {
                        setState(() {
                          query = value;
                        });
                      },
                      decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.search),
                          hintText: "Search places or ZIP code"),
                    ),
                  ),
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
                        // to compact
                        leading: Container(
                          width: 48,
                          height: double.infinity,
                          alignment: Alignment.center,
                          child: Text(
                            zipCode['code'].toString(),
                            textAlign: TextAlign.center,
                            style: kZipCodeNumberStyle,
                          ),
                        ),
                        // subtitle: Text(zipCode['area'] as String),
                        title: Text(
                          zipCode['town'] as String,
                          style: kZipCodeCityTextStyle,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
