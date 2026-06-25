import 'package:meals_app/features/home/data/models/meal_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  static final DBHelper instance = DBHelper();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'meals.db');
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE meals (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      url TEXT NOT NULL,
      description TEXT NOT NULL,
      rate REAL NOT NULL,
      minimumTime INTEGER NOT NULL,
      maximumTime INTEGER NOT NULL
    )
  ''');
  }

  Future<int> insertMeal(Meal meal) async {
    Map<String, dynamic> mealMap = meal.toMap();
    final db = await database;
    return await db.insert('meals', mealMap);
  }

  Future<List<Meal>> getMeals() async {
    final db = await database;
    List<Map<String, dynamic>> mealJson = await db.query('meals');
    List<Meal> meals = mealJson.map((mealJson) => Meal.fromMap(mealJson)).toList();
    return meals;
  }
}
