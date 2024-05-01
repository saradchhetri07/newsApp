import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:news_app/features/daily_news/presentation/widgets/article_tile.dart';

import '../../../../../core/utils/appBar.dart';

class DailyNews extends StatefulWidget {
  const DailyNews({super.key});

  @override
  State<DailyNews> createState() => _DailyNewsState();
}

class _DailyNewsState extends State<DailyNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(
          onShowSavedArticles: () => _onShowSavedArticlesViewTapped(context)),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
      builder: (_, state) {
        if (state is RemoteArticleLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
        if (state is RemoteArticleError) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
        if (state is RemoteArticleDone) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ArticleWidget(
                  article: state.articles![index],
                  onArticlePressed: (article) =>
                      _onArticlePressed(article, context));
            },
            itemCount: state.articles!.length,
          );
        }
        return const SizedBox();
      },
    );
  }

  void _onArticlePressed(ArticleEntity article, BuildContext context) {
    print("came inside _onarticlepressed");
    Navigator.pushNamed(context, '/articleDetails', arguments: article);
  }

  // _buildAppBar() {
  //   return AppBar(
  //     title: const Text(
  //       "Daily News",
  //       style: TextStyle(color: Colors.black),
  //     ),
  //     actions: [
  //       GestureDetector(
  //           onTap: () => _onShowSavedArticlesViewTapped(context),
  //           child: const Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 8.0),
  //             child: Icon(
  //               Icons.bookmark,
  //               color: Colors.black,
  //             ),
  //           ))
  //     ],
  //   );
  // }

  void _onShowSavedArticlesViewTapped(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/SavedArticles');
  }
}
