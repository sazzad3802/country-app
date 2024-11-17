import 'package:drift/drift.dart';

import '../database_provider.dart';
import 'package:drift/drift.dart' as drift;

class CountryDao {
  final _db = AppDatabase.database;

  Future<void> insertAll(List<CountryDtoCompanion> companions) async {
    try {
      await _db.batch((batch) {
        batch.insertAll(_db.countryDto, companions);
      });
    } catch (e) {
      print("Errrr  $e");
    }
  }

  Future<List<CountryDtoData>> getAll() async {
    return await _db.select(_db.countryDto).get();
  }

  Future<dynamic> deleteAll() async {
    _db.countryDto.deleteAll();
  }

  Future<dynamic> insertCountry(CountryDtoCompanion companion) async {
    return await _db
        .into(_db.countryDto)
        .insert(companion, mode: InsertMode.insert);
  }

  Future<List<CountryDtoData>> getCountry(int id) async {
    return await (_db.select(_db.countryDto)..where((v) => v.rowId.equals(id)))
        .get();
  }

  Future<int> updateCountry(CountryDtoCompanion companion) async {
    return await (_db.update(_db.countryDto)
          ..where((tbl) => tbl.rowId.equals(companion.gid.value)))
        .write(companion);
  }

  Future<int> deleteCountry(int id) async {
    return await (_db.delete(_db.countryDto)
          ..where((tbl) => tbl.rowId.equals(id)))
        .go();
  }
}
