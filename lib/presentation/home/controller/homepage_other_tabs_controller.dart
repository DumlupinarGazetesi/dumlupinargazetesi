import 'package:dumlupinargazetesi/generals/api_services/api_repository.dart';
import 'package:dumlupinargazetesi/generals/models/entry/entry_model.dart';
import 'package:dumlupinargazetesi/generals/utils/app_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeScreenSecondaryTabsController extends GetxController {
  final DumlupinarGazetesiApiClient _apiClient = DumlupinarGazetesiApiClient(AppHelper.dioConfig.dio);

  final int catId;
  int? lazyLoadingLastPage;

  HomeScreenSecondaryTabsController({required this.catId}) {
    subCategoryId(catId);
  }

  final ScrollController subCatEntriesScrollCtrl = ScrollController();

  RxBool loading = false.obs;

  RxBool gettingCategoryEntries = false.obs;
  // for lazy loading
  bool isLoadingMoreCategoryEntries = false;
  int page = 1;

  RxInt subCategoryId = 0.obs;

  RxList<Entry> subCategoryEntries = <Entry>[].obs;

  @override
  void onInit() {
    getCategoryEntries();

    subCatEntriesScrollCtrl.addListener(_setScrollerListener);

    super.onInit();
  }

  getCategoryEntries() async {
    if (!_scrollCtrlStatus) {
      _initializeScrollControllerListener();
    }

    gettingCategoryEntries(page == 1);
    isLoadingMoreCategoryEntries = true;

    final result = await _apiClient.getCategoryEntries("$catId", page, 20);

    if (result.response.statusCode == 200) {
      lazyLoadingLastPage = result.data.data?.totalPages;

      subCategoryEntries.addAll(result.data.data?.entries ?? []);
    }

    gettingCategoryEntries(false);
    isLoadingMoreCategoryEntries = false;
  }

  get _scrollCtrlStatus => subCatEntriesScrollCtrl.hasClients;

  _setScrollerListener() async {
    if (subCatEntriesScrollCtrl.position.extentAfter <= 400 &&
        !isLoadingMoreCategoryEntries &&
        page < (lazyLoadingLastPage ?? 0)) {
      page++;

      getCategoryEntries();
    }
  }

  _initializeScrollControllerListener() {
    subCatEntriesScrollCtrl.addListener(_setScrollerListener);
  }

  @override
  void dispose() {
    subCatEntriesScrollCtrl.removeListener(_setScrollerListener);

    subCatEntriesScrollCtrl.dispose();
    super.dispose();
  }
}
