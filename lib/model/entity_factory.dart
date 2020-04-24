import 'package:flutter_hexun/model/article_entity.dart';
import 'package:flutter_hexun/model/category_entity.dart';
import 'package:flutter_hexun/model/mei_zi_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "ArticleEntity") {
      return ArticleEntity.fromJson(json) as T;
    } else if (T.toString() == "CategoryEntity") {
      return CategoryEntity.fromJson(json) as T;
    } else if (T.toString() == "MeiZiEntity") {
      return MeiZiEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}