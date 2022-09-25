import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:zipcodeph_web/models/zipcode.dart';

class ZIPCodeController {
  Future<List<dynamic>> getZipCodes(String province) async {
    String data = await rootBundle.loadString("assets/codes.json");
    final parsedData = jsonDecode(data)["codes"];
    parsedData.map<ZIPCodeModel>((json) {
      return ZIPCodeModel.fromJson(json);
    }).toList();
    final filtered = parsedData.where((z) => z["area"] == province).toList();
    return filtered;
  }
}
