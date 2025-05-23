import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/core/utils/app_assets.dart';

import '../../core/utils/app_style.dart';

class MyCusstomAppbar extends StatelessWidget {
  const MyCusstomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppAssets.splashAppbar,
            width: 38,
            height: 31,
            fit: BoxFit.scaleDown,
          ),
          SizedBox(width: 10),
          Text('Stylish', style: AppTextStyle.textAppbar),
        ],
      ),
    );
  }
}
