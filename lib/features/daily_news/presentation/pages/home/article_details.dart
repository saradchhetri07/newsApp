import 'package:flutter/material.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';

import '../../../../../core/utils/appBar.dart';

class ArticleDetails extends StatelessWidget {
  final ArticleEntity article;
  const ArticleDetails({required this.article});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: buildCustomAppBar(
            onShowSavedArticles: () => _onShowSavedArticlesViewTapped(context)),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Container(
                    height: screenSize.height * 0.4,
                    width: double.maxFinite,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.network(
                        article!.urlToImage ?? "",
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes
                                          as num)
                                  : null,
                            ),
                          );
                        },
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return const Icon(Icons.error);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "${article.title}",
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("${article.description}",
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w400)),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void _onShowSavedArticlesViewTapped(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/SavedArticles');
  }
}
