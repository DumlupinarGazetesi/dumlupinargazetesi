import 'package:dumlupinargazetesi/generals/models/entry/entry_model.dart';
import 'package:dumlupinargazetesi/generals/themes/colors.dart';
import 'package:dumlupinargazetesi/generals/utils/date_converter.dart';
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
      permanent: false,
    );
    super.initState();
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
                _buildAppBar(context),
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

  Widget _buildAppBar(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: DumlupinarColors.whiteColor,
        border: Border(bottom: BorderSide(color: DumlupinarColors.tintColor)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIconButton(Icons.arrow_back_ios, "Geri", () => Navigator.pop(context)),
          _buildIconButton(Icons.share, "Paylaş", () {}),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, String text, VoidCallback onTap) {
    return TextButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 16, color: DumlupinarColors.blackColor),
      label: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: DumlupinarColors.blackColor,
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
    return widget.entryDetail.imageDefault != null
        ? Image.network(
            widget.entryDetail.imageDefault!,
            fit: BoxFit.fitWidth,
            width: MediaQuery.sizeOf(context).width,
          )
        : const SizedBox(); // Handles null image cases
  }

  Widget _buildAuthorInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircleAvatar(
          maxRadius: 15,
          backgroundColor: Colors.black12,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Author Name",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
            ),
            Text(
              DateUtil.formatTurkishDateWithYear(widget.entryDetail.createdAt?.toString() ?? ''),
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: DumlupinarColors.grayColor,
              ),
            ),
          ],
        ),
      ],
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
