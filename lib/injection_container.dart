import 'package:clean_architecture_new_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_architecture_new_app/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:clean_architecture_new_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:clean_architecture_new_app/features/daily_news/domain/usecases/get_article.dart';
import 'package:clean_architecture_new_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //    Dio
  sl.registerSingleton<Dio>(Dio());

  //   Dependence
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  //   UseCases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  //   Blocs
  sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));
}
