import 'package:flutter/material.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/widgets/app_raduis.dart';
import 'package:shop/core/widgets/app_svg.dart';

import '../../core/utils/app_style.dart';

class CustomCardProfile extends StatelessWidget {
  const CustomCardProfile({
    super.key,
    required this.iconPath,
    required this.title,
    this.onTap,
  });
  final String iconPath;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          tileColor: Color(AppColor.white),
          shape: RoundedRectangleBorder(borderRadius: AppRadius.buttonRaduis),
          leading: AppSvgImage.showSvgImage(
            height: 100,
            width: 100,
            path: iconPath,
            fit: BoxFit.scaleDown,
          ),
          title: Text(title, style: AppTextStyle.regular9),
          trailing: AppSvgImage.showSvgImage(
            path: AppAssets.add,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
