import 'package:dumlupinargazetesi/generals/api_services/api_repository.dart';
import 'package:dumlupinargazetesi/generals/models/entry/entry_detail.dart';
import 'package:dumlupinargazetesi/generals/models/entry/entry_model.dart';
import 'package:dumlupinargazetesi/generals/utils/app_helper.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class PostDetailController extends GetxController {
  final DumlupinarGazetesiApiClient _apiClient = DumlupinarGazetesiApiClient(AppHelper.dioConfig.dio);

  EntryDetail? entryDetail;

  final Entry entry;

  final RxBool isGettingEntryDetail = false.obs;

  PostDetailController({required this.entry});

  @override
  void onInit() {
    getEntryDetail();
    super.onInit();
  }

  @override
  void dispose() {
    entryDetail = null;
    super.dispose();
  }

  Future getEntryDetail() async {
    isGettingEntryDetail(true);

    final result = await _apiClient.getEntryData("${entry.srcId ?? entry.id}");

    if (result.response.statusCode == 200) {
      entryDetail = result.data;
    } else {
      AppHelper.log.log(Level.error, result.response.statusMessage);
    }

    isGettingEntryDetail(false);
  }

  Future getAuthorInfo() async {}

  Future getEntryComments() async {
    final result = await _apiClient.getEntryComments("${entry.srcId ?? entry.id}");

    if (result.response.statusCode == 200) {
      // do something
    } else {
      AppHelper.log.log(Level.error, result.response.statusMessage);
    }
  }
}
