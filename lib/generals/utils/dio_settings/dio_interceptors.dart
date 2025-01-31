part of 'dio_config.dart';

List<String> apiCacheList = [];

final defaultCacheOptions = CacheOptions(
  policy: CachePolicy.noCache,
  store: hiveCacheStore,
  priority: CachePriority.normal,
  hitCacheOnErrorExcept: [401, 403, 500],
  maxStale: const Duration(days: 2),
);

final PrettyDioLogger prettyDioLogger = PrettyDioLogger(
  responseBody: false,
  request: true,
  requestHeader: true,
  error: true,
  requestBody: true,
);

final DioCacheInterceptor dioCacheInterceptor = DioCacheInterceptor(
  options: defaultCacheOptions,
);

class RequestInterceptors extends Interceptor {
  bool isShowingDialog = false, sendingLogToServer = false;

  List<DioExceptionType> dioExceptionTypes = [
    DioExceptionType.connectionTimeout,
    DioExceptionType.sendTimeout,
    DioExceptionType.receiveTimeout,
    DioExceptionType.cancel,
    DioExceptionType.connectionError,
  ];



  RequestInterceptors();

  bool _shouldCacheRequest(String path) {
    return apiCacheList.any((element) => path.contains(element));
  }

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    String appToken = DumlupinarApiAddresses.authorization;

    options.headers['Authorization'] = "Bearer $appToken";
    options.queryParameters.removeWhere((k, v) => v == null || v.toString().isEmpty);

    if (options.method != 'POST' && _shouldCacheRequest(options.path)) {
      options.extra = defaultCacheOptions.copyWith(policy: CachePolicy.forceCache).toExtra();
    }

    return handler.next(options);
  }

  @override
  void onResponse(response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // _sendLogToServer(err);

    if (dioExceptionTypes.contains(err.type)) {
      return handler.next(err);
    }

    if (get_pkg.Get.context != null && !isShowingDialog) {
      isShowingDialog = true;
      return AwesomeDialog(
        context: get_pkg.Get.context!,
        dialogType: DialogType.info,
        animType: AnimType.scale,
        autoDismiss: true,
        title: tr(LocaleKeys.error_connect),
        desc: err.message,
        btnOkOnPress: () => get_pkg.Get.back(),
      ).show().then((value) {
        // Reset flag after dialog is closed
        isShowingDialog = false;
        return handler.next(err);
      });
    }

    return handler.next(err);
  }
}
