import '../model/article_model.dart';

abstract class AbstractClassRepository {
  Future<List<ArticleModel>> getAllNews();
  Future<List<ArticleModel>> getCategory(String category);
}