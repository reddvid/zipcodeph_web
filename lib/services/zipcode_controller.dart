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

  Future<List<dynamic>> getAllZipCodes() async {
    String data = await rootBundle.loadString("assets/codes.json");
    final parsedData = jsonDecode(data)["codes"];
    parsedData.map<ZIPCodeModel>((json) {
      return ZIPCodeModel.fromJson(json);
    }).toList();
    return parsedData;
  }

  Future<List<dynamic>> find(String query) async {
    String data = await rootBundle.loadString("assets/codes.json");
    final parsedData = jsonDecode(data)["codes"];
    parsedData.map<ZIPCodeModel>((json) {
      return ZIPCodeModel.fromJson(json);
    }).toList();
    if (query.length >= 3) {
      final filtered = parsedData
          .where((z) =>
              (z["area"] as String)
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              (z["town"] as String)
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              (z["code"] as String) == query)
          .toList();
      return filtered;
    } else {
      return parsedData;
    }
  }

  Future<List<dynamic>> findInProvince(String query, String province) async {
    String data = await rootBundle.loadString("assets/codes.json");
    final parsedData = jsonDecode(data)["codes"];
    parsedData.map<ZIPCodeModel>((json) {
      return ZIPCodeModel.fromJson(json);
    }).toList();
    final provinceList =
        parsedData.where((z) => z["area"] == province).toList();
    if (query.length >= 3) {
      final filtered = provinceList
          .where((z) =>
              (z["town"] as String)
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              (z["code"] as String) == query)
          .toList();
      return filtered;
    } else {
      return provinceList;
    }
  }
}
