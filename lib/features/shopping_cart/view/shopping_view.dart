import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_style.dart';
import 'package:shop/features/shopping_cart/view/recent_product.dart';
import 'package:shop/features/catogry/view/catagory_part.dart';
import 'package:shop/features/weight/search_appBar.dart';

class ShopingPage extends StatelessWidget {
  const ShopingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Color(AppColor.loginbtn),
          borderRadius: BorderRadius.circular(40),
        ),
        child: SvgPicture.asset(
          AppAssets.bag,
          width: 32,
          height: 32,
          fit: BoxFit.scaleDown,
        ),
      ),
      appBar: AppBar(
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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchAppBar(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'All Featured',
                  style: AppTextStyle.allFeathureStyle,
                ),
              ),
            ),
            const SizedBox(height: 20),
            CategoriesSection(),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Products',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  height: 22 / 18,
                  letterSpacing: 0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            RecentProducts(),
          ],
        ),
      ),
    );
  }
}
