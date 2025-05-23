// import 'package:flutter/material.dart';
// import 'package:shop/core/utils/app_colors.dart';
// import 'package:shop/core/utils/string.dart';

// class Lanuage_view extends StatefulWidget {
//   const Lanuage_view({super.key});

//   @override
//   State<Lanuage_view> createState() => _Lanuage_viewState();
// }

// class _Lanuage_viewState extends State<Lanuage_view> {
//   String selectedLang = 'EN';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         leading: Row(
//           children: [
//             IconButton(
//               icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
//               onPressed: () {
//                 Navigator.pushReplacementNamed(
//                   context,
//                   Routes.Onboarding1_View,
//                 );
//               },
//             ),
//             SizedBox(width: 140),
//             Title(
//               color: Colors.black,
//               child: Text("Settings", style: TextStyle(fontSize: 24)),
//             ),
//           ],
//         ),
//       ),

//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text('Language', style: TextStyle(fontSize: 18)),
//             Container(
//               height: 40,
//               decoration: BoxDecoration(
//                 //color: const Color(0xFFE0E0E0),
//                 color: Color(AppColor.activedottscolor),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Row(
//                 children: [_buildLangButton('AR'), _buildLangButton('EN')],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildLangButton(String lang) {
//     bool isSelected = selectedLang == lang;
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedLang = lang;
//         });
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         decoration: BoxDecoration(
//           color: isSelected ? Color(AppColor.loginbtn) : Colors.transparent,
//           borderRadius: BorderRadius.circular(6),
//         ),
//         child: Text(
//           lang,
//           style: TextStyle(
//             color: isSelected ? Colors.white : Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/widgets/custom_language_color.dart';
import 'package:shop/features/settings/manager/setting_cubit.dart';
import 'package:shop/features/settings/manager/setting_state.dart';
import '../../../../core/translation/translation_helper.dart';
import '../../../../core/translation/translation_keys.dart';
import '../../../../core/utils/app_assets.dart';

class Lanuage_view extends StatefulWidget {
  const Lanuage_view({super.key});

  @override
  State<Lanuage_view> createState() => _Lanuage_viewState();
}

class _Lanuage_viewState extends State<Lanuage_view> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => LanguageCubit(),
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(AppColor.activedottscolor),
              leading: IconButton(
                color: Color(AppColor.onboardingtext),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Transform(
                  alignment: Alignment.center,
                  transform:
                      LanguageCubit.get(context).isArabic
                          ? Matrix4.rotationY(3.14)
                          : Matrix4.rotationX(0),
                  child: SvgPicture.asset(
                    AppAssets.sitting,
                    width: 28,
                    height: 28,
                  ),
                ),
              ),
              title: Text(
                TranslationKeys.language.tr,
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                SizedBox(height: height * 0.124),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Row(
                    children: [
                      Text(
                        TranslationKeys.language.tr,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),

                      SizedBox(width: width * 0.23),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                        ),

                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                LanguageCubit.get(context).changeLanguage(true);
                              },
                              child: Stack(
                                children: [
                                  CustomLanguageContainer.getCustomLanguageContainer(
                                    backgroundColor:
                                        LanguageCubit.get(context).isArabic
                                            ? Color(AppColor.activedottscolor)
                                            : const Color(0xffD9D9D9),
                                    text: TranslationKeys.arabic.tr,
                                    textColor:
                                        LanguageCubit.get(context).isArabic
                                            ? Colors.white
                                            : Color(AppColor.onboardingtext),
                                    borderRadius:
                                        LanguageCubit.get(context).isArabic
                                            ? BorderRadius.only(
                                              topRight: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                            )
                                            : BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              bottomLeft: Radius.circular(5),
                                            ),
                                  ),
                                  if (LanguageCubit.get(context).isArabic)
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        margin: EdgeInsets.all(4),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                LanguageCubit.get(
                                  context,
                                ).changeLanguage(false);
                              },
                              child: Stack(
                                children: [
                                  CustomLanguageContainer.getCustomLanguageContainer(
                                    backgroundColor:
                                        !LanguageCubit.get(context).isArabic
                                            ? Color(AppColor.activedottscolor)
                                            : const Color(0xffD9D9D9),
                                    text: TranslationKeys.english.tr,
                                    textColor:
                                        !LanguageCubit.get(context).isArabic
                                            ? Colors.white
                                            : Color(AppColor.onboardingtext),
                                    borderRadius:
                                        LanguageCubit.get(context).isArabic
                                            ? BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              bottomLeft: Radius.circular(5),
                                            )
                                            : BorderRadius.only(
                                              topRight: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                            ),
                                  ),
                                  if (!LanguageCubit.get(context).isArabic)
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          color: Color(
                                            AppColor.inactivdotcolor,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        margin: EdgeInsets.all(4),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
