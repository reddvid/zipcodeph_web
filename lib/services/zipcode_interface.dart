import '../models/zipcode.dart';

abstract class IZIPCodeRepository {
  Future<List<ZIPCodeModel>?> getAll();
  Future<List<ZIPCodeModel>?> getZipCodes(String area);
  Future<List<ZIPCodeModel>?> find(String query);
}
