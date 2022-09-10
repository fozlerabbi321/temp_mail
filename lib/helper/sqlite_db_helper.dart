import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../utils/constants.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _initiateDatabase();
    return _database;
  }

  Future<Database> _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, Constants.dbName);
    var database = await openDatabase(path, version: Constants.dbVersion,
        onCreate: (Database db, int version) async {
      
      await db.execute('''
            CREATE TABLE ${Constants.tableNameDomains}(
            ${DomainColumn.columnId} TEXT,
            ${DomainColumn.columnDomain} TEXT,
            ${DomainColumn.columnIsActive} INTEGER,
            ${DomainColumn.columnIsPrivate} INTEGER,
            ${DomainColumn.columnCreatedAt} TEXT,
            ${DomainColumn.columnUpdatedAt} TEXT
            
            )
            
        ''');
    });
    return database;
  }
}

class DomainColumn {
  static const columnId = 'id';
  static const columnDomain = 'domain';
  static const columnIsActive = 'isActive';
  static const columnIsPrivate = 'isPrivate';
  static const columnCreatedAt = 'createdAt';
  static const columnUpdatedAt = 'updatedAt';
}
