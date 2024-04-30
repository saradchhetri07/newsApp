import 'dart:io';
import 'package:news_app/core/constants/constant.dart';
import 'package:news_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app/features/daily_news/data/models/article.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:dio/dio.dart';
import '../../../../core/resources/data_state.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  //NewsApiService _newsApiService = new NewsApiService();

  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticle() async {
    // print("getNewsArticleImplementation");
    try {
//       newsAPIBaseurl
// newsapiKey
// countryQuery
// categoryQuery
      final httpResponse = await _newsApiService.getNewsArticle(
          apiKey: newsapiKey, country: countryQuery, category: categoryQuery);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        print("httpResponse data is ${httpResponse.data}");
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
