import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';

class DatabaseConnection{
  setDatabase()async{
    // var directory = await getApplicationDocumentsDirectory();
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_user');
    var database= await openDatabase(path , version: 1, onCreate: _onCreatingDatabase);
    return database;

  }
  _onCreatingDatabase(Database db, int version) async{
    await db.execute('CREATE TABLE userModel(id INTEGER PRIMARY_KEY AUTOINCREMENT, name TEXT, email TEXT, password TEXT)');
  }
}

