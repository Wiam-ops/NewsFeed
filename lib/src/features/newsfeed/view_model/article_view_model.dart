import 'dart:io';

import '../model/article_model.dart';

class ArticleViewModel {
  ArticleModel? articleModel;
  final String title;
  final String author;
  final String description;
  final String content;
  late final File? imageFile;

  ArticleViewModel({
    this.articleModel,
    required this.title,
    required this.author,
    required this.description,
    required this.content,
    this.imageFile,
  });

  get sourceName => articleModel?.source?.name;
  get publishedAt => articleModel?.publishedAt;
}
