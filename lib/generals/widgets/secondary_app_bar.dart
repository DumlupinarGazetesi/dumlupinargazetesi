import 'package:dumlupinargazetesi/generals/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class SecondaryAppBar extends StatelessWidget {
  const SecondaryAppBar({super.key, required this.shareData});

  final String shareData;

  @override
  Widget build(BuildContext context) {
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
          _buildIconButton(Icons.share, "Paylaş", () {
            Share.shareUri(Uri.parse(shareData));
          }),
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
}
