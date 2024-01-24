class MainCategory {
  final String mainCategory;
  final SubCategory subCategory;

  MainCategory(this.mainCategory, [SubCategory? subCategory])
      : subCategory = subCategory ?? SubCategory([]);

  // toJSON method for serialization to JSON
  Map<String, dynamic> toJSON() {
    return {
      'mainCategory': mainCategory,
      'subCategory': subCategory.toJSON(),
    };
  }

  // toMap method for serialization to Map
  Map<String, dynamic> toMap() {
    return {
      'mainCategory': mainCategory,
      'subCategory': subCategory.toMap(),
    };
  }
}

class SubCategory {
  final List<String> items;

  SubCategory(this.items);

  // toJSON method for serialization to JSON
  List<String> toJSON() {
    return items;
  }

  // toMap method for serialization to Map
  Map<String, dynamic> toMap() {
    return {
      'items': items,
    };
  }
}
