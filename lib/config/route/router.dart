import 'package:flutter/material.dart';
import 'package:news_app/features/daily_news/presentation/pages/errorPage/not_found.dart';
import 'package:news_app/features/daily_news/presentation/pages/home/article_details.dart';

import '../../features/daily_news/domain/entities/article.dart';

const String articleDetails = '/articleDetails';

MaterialPageRoute generateroute(RouteSettings settings) {
  return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        switch (settings.name) {
          case articleDetails:
            ArticleEntity article = settings.arguments as ArticleEntity;
            return ArticleDetails(article: article);

          default:
            return const NotFound();
        }
      });
}
