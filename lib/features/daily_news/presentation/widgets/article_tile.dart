import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';

class ArticleWidget extends StatelessWidget {
  final ArticleEntity? article;
  final bool? isRemovable;
  final void Function(ArticleEntity article)? onArticlePressed;
  final void Function(ArticleEntity article)? onRemove;
  const ArticleWidget(
      {Key? key,
      this.article,
      this.isRemovable = false,
      this.onArticlePressed,
      this.onRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 2.2,
      child: Row(
        children: [
          _buildImage(context),
          _buildTitleAndDescription(),
          _buildRemovableArea(),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    print("buildImage ${article!.urlToImage} ");
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.0),
        child: CachedNetworkImage(
          imageUrl: article!.urlToImage ?? "",
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

Widget _buildTitleAndDescription() {
  return Container();
}

Widget _buildRemovableArea() {
  return Container();
}
