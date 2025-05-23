import 'package:flutter/material.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/string.dart';
import 'package:shop/core/widgets/custom_buttom.dart';
import 'package:shop/features/auth/views/log_in_view.dart';

class Start_View extends StatelessWidget {
  const Start_View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppAssets.login, fit: BoxFit.cover),
          ),

          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.3)),
          ),

          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'You want\nAuthentic, here\nyou go!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppAssets.fontfamily,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Find it here, buy it now!',
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 24),

                CustomBottom(
                  width: 270,
                  text: "Login",
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.Login_view);
                  },
                  backgroundColor: Color(AppColor.loginbtn),
                ),

                CustomBottom(
                  width: 270,
                  text: "Register",
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.SignUp_view);
                  },
                  backgroundColor: Colors.white,
                  textColor: const Color(0xFFFF2E63),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
