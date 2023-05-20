import 'package:flutter_test/flutter_test.dart';

import 'package:recipe_ingrediet_search/recipe.dart';

void main() {
  var name = 'fried beans';
  var recipeUrl = 'https://www.friedbeans.org';
  var ingredients = ['carrot', 'onion', 'green beans'];
  group('recipe tests', () {
      Recipe recipe = Recipe(name, recipeUrl, ingredients);

      test('recipe name', () {
          expect(recipe.name, name);
      });

      test('recipe url', () {
          Uri url = Uri.parse(recipeUrl);
          expect(recipe.url, url);
          expect(recipe.url.toString(), url.toString());
      });

      test('recipe ingredients', () {
          expect(recipe.ingredients, ingredients);
      });
  
      test('recipe fromJson factory', () {
          Uri url = Uri.parse(recipeUrl);
          var recipeMap = {'name': name, 'url': recipeUrl, 'ingredients': ingredients};
          var factoryRecipe = Recipe.fromJson(recipeMap);
          expect(factoryRecipe.name, name);
          expect(factoryRecipe.url, url);
          expect(factoryRecipe.ingredients, ingredients);
      });

      test('recipe fromJson factory missing name', () {
          var recipeMap = {'url': recipeUrl, 'ingredients': ingredients};
          expect(() => Recipe.fromJson(recipeMap), throwsA(isA<ArgumentError>()));
      });

      test('recipe fromJson factory method missing url', () {
          var recipeMap = {'name': name, 'ingredients': ingredients};
          expect(() => Recipe.fromJson(recipeMap), throwsA(isA<ArgumentError>()));
      });

      test('recipe fromJson factory method missing ingredients', () {
          var recipeMap = {'name': name, 'url': recipeUrl};
          expect(() => Recipe.fromJson(recipeMap), throwsA(isA<ArgumentError>()));
      });
  });
}
