import 'package:dumlupinargazetesi/generals/models/authors/author.dart';
import 'package:dumlupinargazetesi/generals/models/entry/entry_model.dart';
import 'package:dumlupinargazetesi/generals/themes/colors.dart';
import 'package:dumlupinargazetesi/generals/utils/date_converter.dart';
import 'package:dumlupinargazetesi/generals/widgets/secondary_app_bar.dart';
import 'package:dumlupinargazetesi/generated/assets.gen.dart';
import 'package:dumlupinargazetesi/presentation/post_page/controller/post_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({super.key, required this.entryDetail});

  final Entry entryDetail;

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  late final PostDetailController _controller;

  @override
  void initState() {
    _controller = Get.put<PostDetailController>(
      PostDetailController(entry: widget.entryDetail),
      tag: '${widget.entryDetail.title}',
    );

    super.initState();
  }

  @override
  void dispose() {
    if (Get.isRegistered<PostDetailController>(tag: '${widget.entryDetail.title}')) {
      Get.delete<PostDetailController>(tag: '${widget.entryDetail.title}');
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () {
            if (_controller.isGettingEntryDetail.isTrue) {
              return const Center(child: CircularProgressIndicator());
            }

            if (_controller.entryDetail == null) {
              return const Center(child: Text('No data'));
            }

            return Column(
              children: [
                SecondaryAppBar(shareData: _controller.entryDetail!.entry!.url!),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 15,
                      children: [
                        _buildTitle(),
                        _buildUpdatedDate(),
                        _buildImage(context),
                        _buildAuthorInfo(),
                        _buildDescription(),
                        _buildDescriptionBody()
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      "Haber Başlığı: ${widget.entryDetail.title ?? ''}",
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
    );
  }

  Widget _buildUpdatedDate() {
    return Text(
      "Güncelleme: ${DateUtil.formatTurkishDateWithYear(widget.entryDetail.createdAt?.toString() ?? '')}",
      style: TextStyle(fontSize: 12, color: DumlupinarColors.grayColor),
    );
  }

  Widget _buildImage(BuildContext context) {
    String? image = _controller.entryDetail?.entry?.image?.url;
    return image != null
        ? Image.network(
            image,
            fit: BoxFit.fitWidth,
            width: MediaQuery.sizeOf(context).width,
          )
        : const SizedBox(); // Handles null image cases
  }

  Widget _buildAuthorInfo() {
    Author? author = _controller.entryDetail?.entry?.author;

    if (author == null) return SizedBox();

    return SizedBox(
      height: 50,
      // width: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network(
              author.avatar ?? '',
              errorBuilder: (context, e, st) {
                return Image.asset(
                  Assets.images.user.path,
                  color: DumlupinarColors.grayColor,
                );
              },
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${author.firstName} ${author.lastName}",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                DateUtil.formatTurkishDateWithYear(widget.entryDetail.createdAt?.toString() ?? ''),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: DumlupinarColors.darkGrayColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Text(
      _controller.entryDetail?.entry?.description ?? '',
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget _buildDescriptionBody() {
    return HtmlWidget(
      _controller.entryDetail?.entry?.body ?? '',
      enableCaching: true,
      textStyle: TextStyle(fontSize: 15),
      onErrorBuilder: (context, _, __) {
        return Text('Error occurred!');
      },
    );
  }
}
