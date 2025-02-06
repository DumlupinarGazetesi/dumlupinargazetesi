import 'package:dio/dio.dart';
import 'package:dumlupinargazetesi/generals/constants/api_addresses.dart';
import 'package:dumlupinargazetesi/generals/models/categories/category_entries.dart';
import 'package:dumlupinargazetesi/generals/models/models.dart';
import 'package:dumlupinargazetesi/generals/models/sections/section_entries_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_repository.g.dart';

@RestApi(baseUrl: DumlupinarApiAddresses.baseUrl)
abstract class DumlupinarGazetesiApiClient {
  factory DumlupinarGazetesiApiClient(Dio dio, {String baseUrl}) = _DumlupinarGazetesiApiClient;

  @GET(DumlupinarApiAddresses.authors)
  Future<HttpResponse<Authors>> getAuthors();

  @GET("${DumlupinarApiAddresses.entryData}{entryId}/comments")
  Future<HttpResponse> getEntryComments(@Path("entryId") String entryId);

  @GET("${DumlupinarApiAddresses.sections}/{section}")
  Future<HttpResponse<SectionsResponse>> getSectionData(@Path("section") String id);

  @GET("${DumlupinarApiAddresses.entryData}{entryId}")
  Future<HttpResponse<EntryDetail>> getEntryData(@Path("entryId") String entryId);

  @GET("${DumlupinarApiAddresses.categories}/{categoryId}/entries")
  Future<HttpResponse<CategoryEntries>> getCategoryEntries(
    @Path("categoryId") String categoryId,
    @Query("page") int page,
    @Query("take") int take,
  );

  @GET(DumlupinarApiAddresses.categories)
  Future<HttpResponse<CategoriesResponse>> getCategories();

  @GET(DumlupinarApiAddresses.exchange)
  Future<HttpResponse<ExchangeData>> getExchange();

  @GET("${DumlupinarApiAddresses.weather}{cityId}")
  Future<HttpResponse<WeatherResponseModel>> getWeather(@Path("cityId") String cityId);

  @GET("${DumlupinarApiAddresses.advertisement}/{advertId}")
  Future<HttpResponse<Advertisements>> getAdvertisement(@Path("advertId") String advertId);

  @POST(DumlupinarApiAddresses.search)
  Future<HttpResponse<SearchResponse>> search(
    @Body() Map<String, dynamic> body,
    @Queries() Map<String, dynamic> queryParams,
  );

  @POST(DumlupinarApiAddresses.stats)
  Future<HttpResponse> sendStats(@Body() Map<String, dynamic> body);

  @GET("${DumlupinarApiAddresses.authors}/{authorId}/entries/{entryId}")
  Future<HttpResponse<EntryDetail>> getAuthorEntry(
    @Path("authorId") String authorId,
    @Path("entryId") String entryId,
  );

  @GET("${DumlupinarApiAddresses.authors}/{authorId}/entries")
  Future<HttpResponse<SectionsResponse>> getAuthorEntries(
    @Path("authorId") int authorId,
    @Query("page") int page,
    @Query("take") int take,
  );

  @GET(DumlupinarApiAddresses.todayAuthors)
  Future<HttpResponse<Authors>> getTodayAuthors();

  @GET(DumlupinarApiAddresses.companyInfo)
  Future<HttpResponse<InfoResponse>> getCompanyInfo();
}
