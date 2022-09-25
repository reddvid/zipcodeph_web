class ZIPCodeModel {
  final int id;
  final String province;
  final String town;
  final int code;

  ZIPCodeModel(
      {required this.id,
      required this.province,
      required this.town,
      required this.code});

  factory ZIPCodeModel.fromJson(Map<String, dynamic> json) {
    return ZIPCodeModel(
        id: json['_id'] as int,
        code: json['code'] as int,
        town: json['town'] as String,
        province: json['area'] as String);
  }

  Map<String, dynamic> toMap() {
    return {'_id': id, 'code': code, 'town': town, 'area': province};
  }
}
