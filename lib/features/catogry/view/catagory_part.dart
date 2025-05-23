// import 'package:flutter/material.dart';
// import 'package:shop/core/utils/app_style.dart';

// class CategoriesSection extends StatelessWidget {
//   final List<Map<String, String>> categories = [
//     {'icon': 'assets/photo/Bueaty.png', 'name': 'Beauty'},
//     {'icon': 'assets/photo/fashion.png', 'name': 'Fashion'},
//     {'icon': 'assets/photo/Kids.png', 'name': 'Kids'},
//     {'icon': 'assets/photo/men.png', 'name': 'Men'},
//     {'icon': 'assets/photo/women.png', 'name': 'Women'},
//   ];

//   CategoriesSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 110,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children:
//             categories.map((category) {
//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     const SizedBox(width: 20),
//                     Container(
//                       width: 60,
//                       height: 60,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       child: Image.asset(
//                         category['icon']!,
//                         width: 40,
//                         height: 4,
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//                     SizedBox(height: 5),
//                     Text(
//                       category['name']!,
//                       textAlign: TextAlign.center,
//                       style: AppTextStyle.categoryText,
//                     ),
//                   ],
//                 ),
//               );
//             }).toList(),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/core/utils/app_style.dart';
import 'package:shop/features/catogry/manager/catogory_cubit.dart';
import 'package:shop/features/catogry/manager/catogoty_state.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CategoryLoaded) {
          final categories = state.categories;
          return SizedBox(
            height: 110,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children:
                  categories.map((category) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Image.asset(
                              category.icon,
                              width: 40,
                              height: 40,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            category.name,
                            textAlign: TextAlign.center,
                            style: AppTextStyle.categoryText,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
            ),
          );
        } else if (state is CategoryError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
