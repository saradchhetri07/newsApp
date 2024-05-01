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
    return InkWell(
      onTap: () => onArticlePressed!(article!),
      child: Container(
          height: MediaQuery.of(context).size.width / 2.4,
          child: Row(
            children: [
              _buildImage(context),
              _buildTitleAndDescription(article!, context),
              _buildRemovableArea(),
            ],
          )),
    );
  }

  Widget _buildImage(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    print("buildImage ${article!.urlToImage} ");
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            height: screenSize.height * 0.2,
            width: screenSize.width * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25), // Set the border radius
            ),
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
                              (loadingProgress.expectedTotalBytes as num)
                          : null,
                    ),
                  );
                },
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return const Icon(Icons.error);
                },
              ),
            )
            // child: ClipRRect(
            //     borderRadius: BorderRadius.circular(24.0),
            //     child: CachedNetworkImage(
            //       imageUrl: article!.urlToImage!,
            //       placeholder: (context, url) => const CircularProgressIndicator(),
            //       errorWidget: (context, url, error) => const Icon(Icons.error),
            //       progressIndicatorBuilder: (context, url, downloadProgress) =>
            //           CircularProgressIndicator(value: downloadProgress.progress),
            //       fadeInDuration: const Duration(milliseconds: 500),
            //     )),
            ),
      ),
    );
  }
}

Widget _buildTitleAndDescription(ArticleEntity article, BuildContext context) {
  Size screenSize = MediaQuery.of(context).size;
  return Container(
    width: screenSize.width * 0.5,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${article.title}",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis, // Use ellipsis for overflow
          maxLines: 4,
        )
      ],
    ),
  );
}

Widget _buildRemovableArea() {
  return Container();
}
