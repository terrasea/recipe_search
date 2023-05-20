class Recipe {
  final String name;
  final Uri url;
  final List<String> ingredients;

  Recipe(this.name, url, this.ingredients) : url = Uri.parse(url);
  factory Recipe.fromJson(Map<String, dynamic> json) {
    if(!json.containsKey('name')) throw ArgumentError("name is required");
    if(!json.containsKey('url')) throw ArgumentError("url is required");
    if(!json.containsKey('ingredients')) throw ArgumentError("ingredients is required");
    return Recipe(
      json['name'],
      json['url'],
      json['ingredients']
    );
  }
}
