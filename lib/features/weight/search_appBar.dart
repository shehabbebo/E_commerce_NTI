import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/core/utils/app_colors.dart';
import '../../core/utils/app_assets.dart';
import '../../core/utils/app_style.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      height: 40,
      decoration: BoxDecoration(
        color: Color(AppColor.white),
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            spreadRadius: 0,
            blurRadius: 9,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          prefixIcon: SvgPicture.asset(AppAssets.search, fit: BoxFit.scaleDown),
          hintText: 'Search any Product..',
          hintStyle: AppTextStyle.searchTextStyly,
        ),
      ),
    );
  }
}
