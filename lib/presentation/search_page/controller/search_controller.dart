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
  bool isLoadingMoreCategoryEntries = false;

  final RxBool searching = false.obs;

  int page = 1;
  final int take = 20;


  @override
  void onInit() {

    scrollController.addListener(_setScrollerListener);

    super.onInit();
  }


  Future search() async {
    if (!_scrollCtrlStatus) {
      _initializeScrollControllerListener();
    }

    searching(page == 1);

    isLoadingMoreCategoryEntries = true;

    final query = {"query": searchTxtController.text};
    // final query = {"query": "Türkiye ve Dünya Üzerinden"};

    final res = await _apiClient.search(query, {"page": page, "take": take});

    if (res.response.statusCode == 200) {
      searchResult.addAll(res.data.entries ?? []);

      int total = res.data.totalPages ?? 0;
      if (totalSearchResultPage != total) totalSearchResultPage = total;
    } else {
      AppHelper.log.log(Level.error, res.response.statusMessage);
    }
    searching(false);
    isLoadingMoreCategoryEntries = false;
  }

  get _scrollCtrlStatus => scrollController.hasClients;

  _setScrollerListener() async {
    if (scrollController.position.extentAfter <= 400 &&
        !isLoadingMoreCategoryEntries &&
        page < (totalSearchResultPage)) {
      page++;

      search();
    }
  }

  _initializeScrollControllerListener() {
    scrollController.addListener(_setScrollerListener);
  }

  resetData() {
    page = 1;

    totalSearchResultPage = 0;
    searchResult.clear();

    searchTxtController.clear();
  }
}
