// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:shop/core/utils/app_colors.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// import '../../../core/utils/app_assets.dart';

// class PromoSlider extends StatefulWidget {
//   const PromoSlider({super.key});

//   @override
//   _PromoSliderState createState() => _PromoSliderState();
// }

// class _PromoSliderState extends State<PromoSlider> {
//   int _currentIndex = 0;
//   final CarouselSliderController _carouselController =
//       CarouselSliderController();

//   final List<Map<String, String>> sliderData = [
//     {
//       'image': 'assets/photo/banner.png',
//       'title': '50-40% OFF',
//       'subtitle': 'Now in (product)\nAll colours',
//       'buttonText': 'Shop Now',
//     },
//     {
//       'image': 'assets/photo/banner.png',
//       'title': 'New Collection',
//       'subtitle': 'Now in (product)\nAll colours',
//       'buttonText': 'Shop Now',
//     },
//     {
//       'image': 'assets/photo/banner.png',
//       'title': 'New Collection',
//       'subtitle': 'Now in (product)\nAll colours',
//       'buttonText': 'Shop Now',
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CarouselSlider(
//           carouselController: _carouselController,
//           options: CarouselOptions(
//             height: 189,
//             autoPlay: true,
//             enlargeCenterPage: true,
//             viewportFraction: 0.9,
//             onPageChanged: (index, reason) {
//               setState(() {
//                 _currentIndex = index;
//               });
//             },
//           ),
//           items:
//               sliderData.map((item) {
//                 return Builder(
//                   builder: (BuildContext context) {
//                     return Container(
//                       width: 343,
//                       height: 200,
//                       margin: EdgeInsets.symmetric(horizontal: 8.0),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                         image: DecorationImage(
//                           image: AssetImage(item['image']!),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       child: Stack(
//                         children: [
//                           Positioned(
//                             left: 16,
//                             top: 20,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   item['title']!,
//                                   style: TextStyle(
//                                     fontFamily: AppAssets.fontfamily,
//                                     fontSize: 22,
//                                     fontWeight: FontWeight.w700,
//                                     color: Color(AppColor.white),
//                                   ),
//                                 ),
//                                 SizedBox(height: 5),
//                                 Text(
//                                   item['subtitle']!,
//                                   style: TextStyle(
//                                     fontFamily: AppAssets.fontfamily,
//                                     fontSize: 12,
//                                     color: Color(AppColor.white),
//                                   ),
//                                 ),
//                                 SizedBox(height: 10),
//                                 OutlinedButton(
//                                   onPressed: () {},
//                                   style: OutlinedButton.styleFrom(
//                                     foregroundColor: Colors.white,
//                                     side: BorderSide(
//                                       color: Colors.white,
//                                       width: 2,
//                                     ),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(6),
//                                     ),
//                                     padding: EdgeInsets.symmetric(
//                                       horizontal: 16,
//                                       vertical: 10,
//                                     ),
//                                   ),
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       Text(
//                                         "Shop Now",
//                                         style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w600,
//                                           fontFamily: AppAssets.fontfamily,
//                                         ),
//                                       ),
//                                       SizedBox(width: 8),
//                                       SvgPicture.asset(
//                                         'assets/icons/arrow_forward.svg',
//                                         width: 16,
//                                         height: 16,
//                                         fit: BoxFit.scaleDown,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               }).toList(),
//         ),
//         const SizedBox(height: 10),
//         AnimatedSmoothIndicator(
//           activeIndex: _currentIndex,
//           count: sliderData.length,
//           effect: WormEffect(
//             dotHeight: 9,
//             dotWidth: 9,
//             activeDotColor: Color(AppColor.activedottscolor),
//             dotColor: Color(AppColor.inactivdotcolor),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/features/slider/manager/slider_cubit.dart';
import 'package:shop/features/slider/manager/slider_state.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SlidersCubit>();

    return BlocBuilder<SlidersCubit, SlidersState>(
      builder: (context, state) {
        if (state is SlidersLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SlidersLoaded) {
          final sliders = state.sliders;

          return Column(
            children: [
              CarouselSlider.builder(
                itemCount: sliders.length,
                itemBuilder: (context, index, realIdx) {
                  final item = sliders[index];
                  return Container(
                    width: 343,
                    height: 200,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(item.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 16,
                          top: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: TextStyle(
                                  fontFamily: AppAssets.fontfamily,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Color(AppColor.white),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                item.subtitle,
                                style: TextStyle(
                                  fontFamily: AppAssets.fontfamily,
                                  fontSize: 12,
                                  color: Color(AppColor.white),
                                ),
                              ),
                              const SizedBox(height: 10),
                              OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  side: const BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 10,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      item.buttonText,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: AppAssets.fontfamily,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    SvgPicture.asset(
                                      'assets/icons/arrow_forward.svg',
                                      width: 16,
                                      height: 16,
                                      fit: BoxFit.scaleDown,
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
                options: CarouselOptions(
                  height: 189,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  onPageChanged: (index, reason) {
                    cubit.changeIndex(index);
                  },
                ),
              ),
              const SizedBox(height: 10),
              BlocBuilder<SlidersCubit, SlidersState>(
                builder: (context, state) {
                  final currentIndex = cubit.currentIndex;
                  return AnimatedSmoothIndicator(
                    activeIndex: currentIndex,
                    count: sliders.length,
                    effect: WormEffect(
                      dotHeight: 9,
                      dotWidth: 9,
                      activeDotColor: Color(AppColor.activedottscolor),
                      dotColor: Color(AppColor.inactivdotcolor),
                    ),
                  );
                },
              ),
            ],
          );
        } else if (state is SlidersError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
