import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final int? id;
  final String? title;
  final String? author;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publisedAt;
  final String? content;

  const ArticleEntity(
      {this.id,
      this.title,
      this.author,
      this.description,
      this.url,
      this.urlToImage,
      this.publisedAt,
      this.content});

  @override
  // TODO: implement props
  List<Object?> get props {
    return [id, author, description, url, urlToImage, publisedAt, content];
  }
}
