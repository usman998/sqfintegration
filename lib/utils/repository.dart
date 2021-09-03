import 'package:sqflite/sqflite.dart';
import 'package:test_app/utils/dataBaseConnection.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:test_app/services/userServices.dart';


class Repository{
  static DatabaseConnection? _databaseConnection;
  Repository() {
    _databaseConnection = DatabaseConnection();
  }
  Database? _database;

  Future<Database?> get database async{
    if(_database != null){ return _database;}

    _database= await _databaseConnection!.setDatabase();
    return _database;
  }
  insertData(table, data)async{
    var connection = await database;
    return await connection!.insert(table, data);

  }


}


//
// class Repository{
//   static final Repository instance = Repository._init();
//   static Database? _database;
//   Repository._init();
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//
//     _database = await _initDB('user.db');
//     return _database!;
//   }
//   Future<Database> _initDB(String filePath) async {
//     var directory = await getApplicationDocumentsDirectory();
//     var path = join(directory.path, filePath);
//     var database= await openDatabase(path , version: 1, onCreate: _createDB);
//     return database;
//   }
//   // _onCreatingDatabase(Database database, int Version) async{
//   //   await database.execute('CREATE TABLE userModel(id INTEGER PRIMARY_KEY AUTOINCREMENT, name TEXT, email TEXT, password TEXT)');
//   // }
//   Future _createDB(Database db, int version) async {
//     final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
//     final textType = 'TEXT NOT NULL';
//     final boolType = 'BOOLEAN NOT NULL';
//     final integerType = 'INTEGER NOT NULL';
//
//     await db.execute('''
//   CREATE TABLE $userNotes (
//     ${UserFeilds.id} $idType,
//     ${UserFeilds.title} $textType,
//     ${UserFeilds.description} $textType,
//   )
//   ''');
//   }
//   Future<User> create(User user) async {
//     final db = await instance.database;
//     final id = await db.insert(userNotes, user.toJson());
//     return user.copy(id: id);
//   }
//   Future close() async {
//     final db = await instance.database;
//
//     db.close();
//   }
//
// }


