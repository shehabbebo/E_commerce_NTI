import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_style.dart';
import 'package:shop/core/widgets/custom_circleAvatar.dart';
import 'package:shop/features/favaurite/view/favaurite_view.dart';
import 'package:shop/features/orderdetails/view/oder_view.dart';
import 'package:shop/features/settings/view/setting_language.dart';
import 'package:shop/features/shopping_cart/view/car_view.dart';
import 'package:shop/features/weight/profile_menu_item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: null,
        centerTitle: true,
        title: Text('Profile', style: AppTextStyle.appbarstylr),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartScreen()),
          );
        },
        child: Container(
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(23),
        child: Column(
          spacing: 30,
          children: [
            CustomCircleAvatar(),
            ProfileMenuItem(
              icon: SvgPicture.asset(AppAssets.profile),
              text: 'My Profile',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            ProfileMenuItem(
              icon: SvgPicture.asset(AppAssets.bag2),
              text: 'My Orders',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrdersScreen()),
                );
              },
            ),
            ProfileMenuItem(
              icon: SvgPicture.asset(AppAssets.heart),
              text: 'My Favorites',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyFavScreen()),
                );
              },
            ),
            ProfileMenuItem(
              icon: SvgPicture.asset(AppAssets.sitting),
              text: 'Settings',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Lanuage_view()),
                );
              },
            ),
            Divider(thickness: 1, color: Color(AppColor.loginbtn)),
            ProfileMenuItem(
              icon: SvgPicture.asset(AppAssets.logout),
              text: 'Log Out',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
