import 'package:flutter_test/flutter_test.dart';

import 'package:recipe_ingrediet_search/db.dart';

import 'package:sqflite_common_ffi/sqflite_ffi.dart' show Database, deleteDatabase;

void main() async {
  
  group('db test', () {
      late Database db;

      setUpAll(() async {
          db = await RecipeDB.openDB();
      });

      tearDownAll(() async {
          // Delete the database
          await deleteDatabase(RecipeDB.path);
      });
      
      test('open db', () {
          expect(db, isInstanceOf<Database>());
      });

      test('db has Recipe table', () async {
          final tables =
            await db.rawQuery('SELECT * FROM sqlite_master ORDER BY name;');
          var tableNames = [];
          for(Map val in tables) {
            tableNames.add(val['name']);
          }
          expect(tableNames, contains('Recipe'));
      });

      test('db recipe table has column name', () async {
          final tableInfo =
            await db.rawQuery('PRAGMA table_info(Recipe);');
          var columnNames = [];
          for(Map val in tableInfo) {
            columnNames.add(val['name']);
          }
          expect(columnNames, contains('name'));
      });

      test('db recipe table column name is type TEXT', () async {
          final tableInfo =
            await db.rawQuery('PRAGMA table_info(Recipe);');
          var columnNames = {};
          for(Map val in tableInfo) {
            columnNames[val['name']] = val;
          }
          expect(columnNames['name']['type'], 'TEXT');
      });

      test('db recipe table has column url', () async {
          final tableInfo =
            await db.rawQuery('PRAGMA table_info(Recipe);');
          var columnNames = [];
          for(Map val in tableInfo) {
            columnNames.add(val['name']);
          }
          expect(columnNames, contains('url'));
      });

      test('db recipe table column url is type TEXT', () async {
          final tableInfo =
            await db.rawQuery('PRAGMA table_info(Recipe);');
          var columnNames = {};
          for(Map val in tableInfo) {
            columnNames[val['name']] = val;
          }
          expect(columnNames['url']['type'], 'TEXT');
      });

      test('db has RecipeIngredient table', () async {
          final tables =
            await db.rawQuery('SELECT * FROM sqlite_master ORDER BY name;');
          var tableNames = [];
          for(Map val in tables) {
            tableNames.add(val['name']);
          }
          expect(tableNames, contains('RecipeIngredient'));
      });

      test('db RecipeIngredient table has column recipe_id', () async {
          final tableInfo =
            await db.rawQuery('PRAGMA table_info(RecipeIngredient);');
          var columnNames = [];
          for(Map val in tableInfo) {
            columnNames.add(val['name']);
          }
          expect(columnNames, contains('recipe_id'));
      });

      test('db recipe table column url is type INTEGER', () async {
          final tableInfo =
            await db.rawQuery('PRAGMA table_info(RecipeIngredient);');
          var columnNames = {};
          for(Map val in tableInfo) {
            columnNames[val['name']] = val;
          }
          expect(columnNames['recipe_id']['type'], 'INTEGER');
      });


      group('Find recipes', () {
          late Database db;
          int recipeId;
          setUpAll(() async {
              db = await RecipeDB.openDB();
              recipeId = await db.insert('Recipe', {'name': 'recipe1', 'url': 'https://url1.fake.com'});
              await db.insert('RecipeIngredient', {'recipe_id': recipeId, 'ingredient': 'carrots'});
          });

          tearDownAll(() async {
              // Delete the database
              await deleteDatabase(RecipeDB.path);
          });
      
          test('db find recipe with specific ingredient', () {
             fail('not implemented'); 
          });
      });
  });
}
