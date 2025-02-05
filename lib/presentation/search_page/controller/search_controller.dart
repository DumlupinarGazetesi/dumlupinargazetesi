import 'package:dumlupinargazetesi/generals/api_services/api_repository.dart';
import 'package:dumlupinargazetesi/generals/models/entry/entry_detail.dart';
import 'package:dumlupinargazetesi/generals/utils/app_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class SearchEntryController extends GetxController {
  final DumlupinarGazetesiApiClient _apiClient = DumlupinarGazetesiApiClient(AppHelper.dioConfig.dio);

  final TextEditingController searchTxtController = TextEditingController();

  final ScrollController scrollController = ScrollController();

  RxList<EntryDetail> searchResult = <EntryDetail>[].obs;

  int totalSearchResultPage = 0;

  final RxBool searching = false.obs;

  int page = 1;
  final int take = 20;

  Future search() async {
    searching(true);

    final query = {"query": searchTxtController.text};

    final res = await _apiClient.search(query);

    if (res.response.statusCode == 200) {
      searchResult(res.data.entries);
      int total = res.data.totalPages ?? 0;
      if (totalSearchResultPage != total) totalSearchResultPage = total;
    } else {
      AppHelper.log.log(Level.error, res.response.statusMessage);
    }
    searching(false);
  }
}
