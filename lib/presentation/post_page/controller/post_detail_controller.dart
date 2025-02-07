import 'package:dumlupinargazetesi/generals/api_services/api_repository.dart';
import 'package:dumlupinargazetesi/generals/models/entry/comments.dart';
import 'package:dumlupinargazetesi/generals/models/entry/entry_detail.dart';
import 'package:dumlupinargazetesi/generals/models/entry/entry_model.dart';
import 'package:dumlupinargazetesi/generals/utils/app_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class PostDetailController extends GetxController {
  final DumlupinarGazetesiApiClient _apiClient = DumlupinarGazetesiApiClient(AppHelper.dioConfig.dio);

  EntryDetail? entryDetail;

  final Entry entry;

  final RxBool isGettingEntryDetail = false.obs;
  final RxBool isGettingEntryComments = false.obs;

  List<Comment> comments = [];

  PostDetailController({required this.entry});

  @override
  void onInit() {
    getEntryDetail();
    sendPostReadToServer();
    getEntryComments();
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
      comments = result.data.comments ?? [];
    } else {
      AppHelper.log.log(Level.error, result.response.statusMessage);
    }
  }

  Future submitComment() async {
    final result = await _apiClient.submitComment(
      entry.id ?? entry.srcId!,
      {
        "body": "",
        "anonym_name": "",
        "anonym_email": "",
        "answer_to": "",
      },
    );

    if (result.response.statusCode == 200) {
      Fluttertoast.showToast(msg: "Yorum oluşturruldi.");
    } else {
      AppHelper.log.log(Level.error, result.response.statusMessage);
    }
  }

  Future likeOrDislikeComment({required int commentId}) async {
    final result = await _apiClient.likeDislikeComment(commentId, {"action": ""});

    if (result.response.statusCode == 200) {
      Fluttertoast.showToast(msg: "Yorum oluşturruldi.");
    } else {
      AppHelper.log.log(Level.error, result.response.statusMessage);
    }
  }

  sendPostReadToServer() {
    _apiClient.sendEntryRead({"type": "entry", "event": "hit", "id": "${entry.id ?? entry.srcId}"});
  }
}
