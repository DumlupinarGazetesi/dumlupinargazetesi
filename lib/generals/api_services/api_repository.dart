import 'package:dio/dio.dart';
import 'package:dumlupinargazetesi/generals/constants/api_addresses.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'api_repository.g.dart';


@RestApi(baseUrl: DumlupinarApiAddresses.baseUrl)
abstract class DumlupinarGazetesiApiClient {
  factory DumlupinarGazetesiApiClient(Dio dio, {String baseUrl}) = _DumlupinarGazetesiApiClient;
}
