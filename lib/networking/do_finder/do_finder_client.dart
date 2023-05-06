import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/networking/api_client/app_interceptor.dart';
import 'package:the_horeca_store/networking/models/search/results.dart';
import 'package:the_horeca_store/networking/models/search/search_response.dart';

part 'do_finder_client.g.dart';

@RestApi(baseUrl: "https://eu1-search.doofinder.com/5")
abstract class DoFinderClient {
  factory DoFinderClient() {
    Dio dio = Dio(BaseOptions(contentType: "application/json"));
    dio.options = BaseOptions(
        receiveTimeout: const Duration(milliseconds: 30000),
        connectTimeout: const Duration(milliseconds: 30000));
    dio.options.headers['Authorization'] = AppThemeData.doFinderKey;

    dio.interceptors.add(PrettyDioLogger(
        requestBody: true, requestHeader: true, responseBody: true, responseHeader: true));
    dio.interceptors.addAll({
      AppInterceptors(dio),
    });
    return _DoFinderClient(dio);
  }


  @GET("/search")
  Future<SearchResponse> searchProductApi(
      @Query('hashid') String hashId,
      @Query('query') String query,
      @Query('rpp') String rpp,
      @Query('page') String page,
      );
}
