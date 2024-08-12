import 'package:clean_architecture_new_app/core/constants/constants.dart';
import 'package:clean_architecture_new_app/features/daily_news/data/models/article.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/everything')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("q") String? q,
    @Query("from") String? from,
    @Query("sortBy") String? sortBy,
    @Query("apiKey") String? apiKey,
  });
}
