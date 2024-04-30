import 'package:dio/dio.dart';
import 'package:news_app/features/daily_news/data/models/article.dart';
import '../../../../../core/constants/constant.dart';
import 'package:retrofit/retrofit.dart';
part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseurl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio, {String? baseUrl}) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticle({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
