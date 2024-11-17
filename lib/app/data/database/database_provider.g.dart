// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_provider.dart';

// ignore_for_file: type=lint
class $CountryDtoTable extends CountryDto
    with TableInfo<$CountryDtoTable, CountryDtoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CountryDtoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _gidMeta = const VerificationMeta('gid');
  @override
  late final GeneratedColumn<int> gid = GeneratedColumn<int>(
      'gid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _longitudeMeta =
      const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<String> longitude = GeneratedColumn<String>(
      'longitude', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _latitudeMeta =
      const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<String> latitude = GeneratedColumn<String>(
      'latitude', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _populationMeta =
      const VerificationMeta('population');
  @override
  late final GeneratedColumn<String> population = GeneratedColumn<String>(
      'population', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [gid, name, longitude, latitude, population];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'country_dto';
  @override
  VerificationContext validateIntegrity(Insertable<CountryDtoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('gid')) {
      context.handle(
          _gidMeta, gid.isAcceptableOrUnknown(data['gid']!, _gidMeta));
    } else if (isInserting) {
      context.missing(_gidMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('population')) {
      context.handle(
          _populationMeta,
          population.isAcceptableOrUnknown(
              data['population']!, _populationMeta));
    } else if (isInserting) {
      context.missing(_populationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CountryDtoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CountryDtoData(
      gid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}gid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      longitude: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}longitude'])!,
      latitude: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}latitude'])!,
      population: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}population'])!,
    );
  }

  @override
  $CountryDtoTable createAlias(String alias) {
    return $CountryDtoTable(attachedDatabase, alias);
  }
}

class CountryDtoData extends DataClass implements Insertable<CountryDtoData> {
  final int gid;
  final String name;
  final String longitude;
  final String latitude;
  final String population;
  const CountryDtoData(
      {required this.gid,
      required this.name,
      required this.longitude,
      required this.latitude,
      required this.population});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['gid'] = Variable<int>(gid);
    map['name'] = Variable<String>(name);
    map['longitude'] = Variable<String>(longitude);
    map['latitude'] = Variable<String>(latitude);
    map['population'] = Variable<String>(population);
    return map;
  }

  CountryDtoCompanion toCompanion(bool nullToAbsent) {
    return CountryDtoCompanion(
      gid: Value(gid),
      name: Value(name),
      longitude: Value(longitude),
      latitude: Value(latitude),
      population: Value(population),
    );
  }

  factory CountryDtoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CountryDtoData(
      gid: serializer.fromJson<int>(json['gid']),
      name: serializer.fromJson<String>(json['name']),
      longitude: serializer.fromJson<String>(json['longitude']),
      latitude: serializer.fromJson<String>(json['latitude']),
      population: serializer.fromJson<String>(json['population']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'gid': serializer.toJson<int>(gid),
      'name': serializer.toJson<String>(name),
      'longitude': serializer.toJson<String>(longitude),
      'latitude': serializer.toJson<String>(latitude),
      'population': serializer.toJson<String>(population),
    };
  }

  CountryDtoData copyWith(
          {int? gid,
          String? name,
          String? longitude,
          String? latitude,
          String? population}) =>
      CountryDtoData(
        gid: gid ?? this.gid,
        name: name ?? this.name,
        longitude: longitude ?? this.longitude,
        latitude: latitude ?? this.latitude,
        population: population ?? this.population,
      );
  CountryDtoData copyWithCompanion(CountryDtoCompanion data) {
    return CountryDtoData(
      gid: data.gid.present ? data.gid.value : this.gid,
      name: data.name.present ? data.name.value : this.name,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      population:
          data.population.present ? data.population.value : this.population,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CountryDtoData(')
          ..write('gid: $gid, ')
          ..write('name: $name, ')
          ..write('longitude: $longitude, ')
          ..write('latitude: $latitude, ')
          ..write('population: $population')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(gid, name, longitude, latitude, population);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CountryDtoData &&
          other.gid == this.gid &&
          other.name == this.name &&
          other.longitude == this.longitude &&
          other.latitude == this.latitude &&
          other.population == this.population);
}

class CountryDtoCompanion extends UpdateCompanion<CountryDtoData> {
  final Value<int> gid;
  final Value<String> name;
  final Value<String> longitude;
  final Value<String> latitude;
  final Value<String> population;
  final Value<int> rowid;
  const CountryDtoCompanion({
    this.gid = const Value.absent(),
    this.name = const Value.absent(),
    this.longitude = const Value.absent(),
    this.latitude = const Value.absent(),
    this.population = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CountryDtoCompanion.insert({
    required int gid,
    required String name,
    required String longitude,
    required String latitude,
    required String population,
    this.rowid = const Value.absent(),
  })  : gid = Value(gid),
        name = Value(name),
        longitude = Value(longitude),
        latitude = Value(latitude),
        population = Value(population);
  static Insertable<CountryDtoData> custom({
    Expression<int>? gid,
    Expression<String>? name,
    Expression<String>? longitude,
    Expression<String>? latitude,
    Expression<String>? population,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (gid != null) 'gid': gid,
      if (name != null) 'name': name,
      if (longitude != null) 'longitude': longitude,
      if (latitude != null) 'latitude': latitude,
      if (population != null) 'population': population,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CountryDtoCompanion copyWith(
      {Value<int>? gid,
      Value<String>? name,
      Value<String>? longitude,
      Value<String>? latitude,
      Value<String>? population,
      Value<int>? rowid}) {
    return CountryDtoCompanion(
      gid: gid ?? this.gid,
      name: name ?? this.name,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      population: population ?? this.population,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (gid.present) {
      map['gid'] = Variable<int>(gid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<String>(longitude.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<String>(latitude.value);
    }
    if (population.present) {
      map['population'] = Variable<String>(population.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountryDtoCompanion(')
          ..write('gid: $gid, ')
          ..write('name: $name, ')
          ..write('longitude: $longitude, ')
          ..write('latitude: $latitude, ')
          ..write('population: $population, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CountryDtoTable countryDto = $CountryDtoTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [countryDto];
}

typedef $$CountryDtoTableCreateCompanionBuilder = CountryDtoCompanion Function({
  required int gid,
  required String name,
  required String longitude,
  required String latitude,
  required String population,
  Value<int> rowid,
});
typedef $$CountryDtoTableUpdateCompanionBuilder = CountryDtoCompanion Function({
  Value<int> gid,
  Value<String> name,
  Value<String> longitude,
  Value<String> latitude,
  Value<String> population,
  Value<int> rowid,
});

class $$CountryDtoTableFilterComposer
    extends Composer<_$AppDatabase, $CountryDtoTable> {
  $$CountryDtoTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get gid => $composableBuilder(
      column: $table.gid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get population => $composableBuilder(
      column: $table.population, builder: (column) => ColumnFilters(column));
}

class $$CountryDtoTableOrderingComposer
    extends Composer<_$AppDatabase, $CountryDtoTable> {
  $$CountryDtoTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get gid => $composableBuilder(
      column: $table.gid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get population => $composableBuilder(
      column: $table.population, builder: (column) => ColumnOrderings(column));
}

class $$CountryDtoTableAnnotationComposer
    extends Composer<_$AppDatabase, $CountryDtoTable> {
  $$CountryDtoTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get gid =>
      $composableBuilder(column: $table.gid, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<String> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<String> get population => $composableBuilder(
      column: $table.population, builder: (column) => column);
}

class $$CountryDtoTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CountryDtoTable,
    CountryDtoData,
    $$CountryDtoTableFilterComposer,
    $$CountryDtoTableOrderingComposer,
    $$CountryDtoTableAnnotationComposer,
    $$CountryDtoTableCreateCompanionBuilder,
    $$CountryDtoTableUpdateCompanionBuilder,
    (
      CountryDtoData,
      BaseReferences<_$AppDatabase, $CountryDtoTable, CountryDtoData>
    ),
    CountryDtoData,
    PrefetchHooks Function()> {
  $$CountryDtoTableTableManager(_$AppDatabase db, $CountryDtoTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CountryDtoTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CountryDtoTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CountryDtoTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> gid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> longitude = const Value.absent(),
            Value<String> latitude = const Value.absent(),
            Value<String> population = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CountryDtoCompanion(
            gid: gid,
            name: name,
            longitude: longitude,
            latitude: latitude,
            population: population,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int gid,
            required String name,
            required String longitude,
            required String latitude,
            required String population,
            Value<int> rowid = const Value.absent(),
          }) =>
              CountryDtoCompanion.insert(
            gid: gid,
            name: name,
            longitude: longitude,
            latitude: latitude,
            population: population,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CountryDtoTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CountryDtoTable,
    CountryDtoData,
    $$CountryDtoTableFilterComposer,
    $$CountryDtoTableOrderingComposer,
    $$CountryDtoTableAnnotationComposer,
    $$CountryDtoTableCreateCompanionBuilder,
    $$CountryDtoTableUpdateCompanionBuilder,
    (
      CountryDtoData,
      BaseReferences<_$AppDatabase, $CountryDtoTable, CountryDtoData>
    ),
    CountryDtoData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CountryDtoTableTableManager get countryDto =>
      $$CountryDtoTableTableManager(_db, _db.countryDto);
}
