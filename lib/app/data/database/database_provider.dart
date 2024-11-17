import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../core/base/app_config.dart';
import 'dto/country_dto.dart';

part 'database_provider.g.dart';

@DriftDatabase(tables: [CountryDto])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static final AppDatabase database = AppDatabase();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'country.db'));
    return NativeDatabase(file,
        logStatements:
            AppConfig.shared.flavor == Flavor.development ? true : false);
  });
}
