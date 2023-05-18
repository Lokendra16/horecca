import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/networking/api_client/app_interceptor.dart';
import 'package:the_horeca_store/networking/base_response.dart';
import 'package:the_horeca_store/networking/models/address_list/address_list_model.dart';
import 'package:the_horeca_store/networking/models/address_list/country_list_response.dart';
import 'package:the_horeca_store/networking/models/category_data/category_model.dart';
import 'package:the_horeca_store/networking/models/product_data/product_detail_response.dart';
import 'package:the_horeca_store/networking/models/product_data/product_model.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://thehorecastore.myshopify.com/admin/api/2023-01/")
abstract class RestClient {
  factory RestClient() {
    Dio dio = Dio(BaseOptions(contentType: "application/json"));
    dio.options = BaseOptions(
        receiveTimeout: const Duration(milliseconds: 30000),
        connectTimeout: const Duration(milliseconds: 30000));
    dio.options.headers['X-Shopify-Access-Token'] = AppThemeData.apiKey;

    dio.interceptors.add(PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true));
    dio.interceptors.addAll({
      AppInterceptors(dio),
    });
    return _RestClient(dio);
  }

  @GET("/custom_collections.json")
  Future<CategoryResponse> getCategoryList(
      @Query("since_id") int pageKey, @Query("limit") int pageSize);

  @GET("/custom_collections.json")
  Future<CategoryResponse> getHomeCategoryList(@Query("ids") String ids);

  @GET("/products.json")
  Future<ProductResponse> getProductList(
      @Query('published_status') String published,
      @Query("limit") int pageSize,
      @Query("collection_id") String collectionId,
      @Query("ids") String? ids,
      @Query('order') String? sortOrder);

  @GET("/products/{product_id}.json")
  Future<ProductDetailResponse> getProductDetail(
      @Path("product_id") String product_id);

  @GET("/customers/{customer_id}/addresses.json")
  Future<AddressListModel> getAddressList(
      @Path("customer_id") String customerId);

  @DELETE("/customers/{customer_id}/addresses/{address_id}.json")
  Future<BaseResponse> deleteAddress(@Path("customer_id") String customerId,
      @Path("address_id") String addressId);

  @GET("/countries.json")
  Future<CountryListResponse> getCountriesList();

  @POST("customers/{customer_id}/addresses.json")
  Future<CountryListResponse> addCountryApi(
      @Path("customer_id") String customerId,
      @Body() Map<String, dynamic> body);
}
