import 'dart:io';

import 'package:clean_architecture_new_app/core/constants/constants.dart';
import 'package:clean_architecture_new_app/core/resources/data_state.dart';
import 'package:clean_architecture_new_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_architecture_new_app/features/daily_news/data/models/article.dart';
import 'package:clean_architecture_new_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        q: qQuery,
        from: fromQuery,
        sortBy: sortByQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioError(
            error: httpResponse.response.statusMessage,
            type: DioErrorType.response,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
