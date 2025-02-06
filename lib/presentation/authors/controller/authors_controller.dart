import 'package:dumlupinargazetesi/generals/api_services/api_repository.dart';
import 'package:dumlupinargazetesi/generals/models/authors/author.dart';
import 'package:dumlupinargazetesi/generals/models/entry/entry_model.dart';
import 'package:dumlupinargazetesi/generals/utils/app_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class AuthorsController extends GetxController {
  final DumlupinarGazetesiApiClient _apiClient = DumlupinarGazetesiApiClient(AppHelper.dioConfig.dio);

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  fetchData() async {
    try {
      loadingAuthors(true);
      var todayAuthors = getTodayAuthors();
      var allAuthors = getAllAuthors();

      await Future.wait([todayAuthors, allAuthors]);
    } catch (e, st) {
      AppHelper.log.log(Level.error, '#error occurred!', error: e, stackTrace: st);
    }

    loadingAuthors(false);
  }

  List<Author> todayAuthors = [];
  List<Author> allAuthors = [];
  RxBool loadingAuthors = false.obs;
  RxBool loadingAuthorEntries = false.obs;

  List<Entry> authorEntries = [];

  final ScrollController scrollController = ScrollController();

  int page = 1;

  Future getTodayAuthors() async {
    final res = await _apiClient.getTodayAuthors();

    if (res.response.statusCode == 200) {
      todayAuthors = res.data.authors ?? [];
    } else {
      AppHelper.log.log(Level.error, res.response.statusMessage);
    }
  }

  Future getAllAuthors() async {
    final res = await _apiClient.getAuthors();

    if (res.response.statusCode == 200) {
      allAuthors = res.data.authors ?? [];
    } else {
      AppHelper.log.log(Level.error, res.response.statusMessage);
    }
  }

  Future getAuthorEntries({required int authorId}) async {
    loadingAuthorEntries(true);

    final res = await _apiClient.getAuthorEntries(authorId, page, 20);

    if (res.response.statusCode == 200) {
      authorEntries = res.data.entries;
    } else {
      AppHelper.log.log(Level.error, res.response.statusMessage);
    }
    loadingAuthorEntries(false);
  }
}
