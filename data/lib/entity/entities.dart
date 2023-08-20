class MenuItemTitleEntity {
  final String title;
  final String languageCode;

  const MenuItemTitleEntity({
    required this.title,
    required this.languageCode,
  });

  factory MenuItemTitleEntity.fromJson(Map<String, dynamic> json) {
    return MenuItemTitleEntity(
      title: json['title'],
      languageCode: json['languageCode'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'languageCode': languageCode,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'languageCode': languageCode,
    };
  }
}

class MenuItemDescriptionEntity {
  final String description;
  final String languageCode;

  const MenuItemDescriptionEntity({
    required this.description,
    required this.languageCode,
  });

  factory MenuItemDescriptionEntity.fromJson(Map<String, dynamic> json) {
    /*log('MenuItemDescriptionEntity.fromJson');
    log(json.toString());*/
    return MenuItemDescriptionEntity(
      description: json['description'],
      languageCode: json['languageCode'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'languageCode': languageCode,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'languageCode': languageCode,
    };
  }
}

class MenuItemIngredientsEntity {
  final List<String> ingredientsList;
  final String languageCode;

  const MenuItemIngredientsEntity({
    required this.ingredientsList,
    required this.languageCode,
  });

  factory MenuItemIngredientsEntity.fromJson(Map<String, dynamic> json) {
    return MenuItemIngredientsEntity(
      ingredientsList: List<String>.from(json['ingredientsList']),
      languageCode: json['languageCode'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ingredientsList': ingredientsList,
      'languageCode': languageCode,
    };
  }


  Map<String, dynamic> toJson() {
    return {
      'ingredientsList': ingredientsList,
      'languageCode': languageCode,
    };
  }
}

class MenuItemCategoryEntity {
  final String category;
  final String languageCode;

  const MenuItemCategoryEntity({
    required this.category,
    required this.languageCode,
  });

  factory MenuItemCategoryEntity.fromJson(Map<String, dynamic> json) {
    return MenuItemCategoryEntity(
      category: json['category'],
      languageCode: json['languageCode'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'languageCode': languageCode,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'languageCode': languageCode,
    };
  }
}
