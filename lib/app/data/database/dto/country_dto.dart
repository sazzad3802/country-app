import 'package:drift/drift.dart';

class CountryDto extends Table {
  IntColumn get gid => integer()();
  TextColumn get name => text()();
  TextColumn get longitude => text()();
  TextColumn get latitude => text()();
  TextColumn get population => text()();

  /*@override
  Set<Column> get primaryKey => {id};*/
}
