import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_style.dart';
import 'package:shop/features/home/manager/home_cubit.dart';
import 'package:shop/features/home/manager/home_state.dart';
import 'package:shop/features/profile/view/profile_pagef.dart';
import 'package:shop/features/shopping_cart/view/car_view.dart';
import 'package:shop/features/shopping_cart/view/shopping_view.dart';
import 'package:shop/features/weight/custom_appBar.dart';
import 'package:shop/features/weight/search_appBar.dart';
import 'package:shop/features/slider/view/slider.dart';
import 'package:shop/features/catogry/view/catagory_part.dart';

class HomeScreenBody extends StatelessWidget {
  HomeScreenBody({super.key});

  final List<Widget> _screens = const [
    HomeScreenBodyContent(),
    ShopingPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = HomeCubit();
        cubit.getAllProducts();
        cubit.getAllCategories();
        cubit.getSliders();
        return cubit;
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = context.watch<HomeCubit>();

          return Scaffold(
            body: _screens[cubit.currentIndex],
            floatingActionButton: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartScreen()),
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
            bottomNavigationBar: SizedBox(
              height: 76,
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                currentIndex: cubit.currentIndex,
                selectedItemColor: const Color(0xFFF83758),
                onTap: (index) => cubit.changeIndex(index),
                items: [
                  BottomNavigationBarItem(
                    icon: _buildSvgIcon(AppAssets.home, 0, cubit.currentIndex),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: _buildSvgIcon(AppAssets.cart, 1, cubit.currentIndex),
                    label: "Items",
                  ),
                  BottomNavigationBarItem(
                    icon: _buildSvgIcon(
                      AppAssets.profile,
                      2,
                      cubit.currentIndex,
                    ),
                    label: "Profile",
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class HomeScreenBodyContent extends StatelessWidget {
  const HomeScreenBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyCusstomAppbar(),
              const SearchAppBar(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  'All Featured',
                  style: AppTextStyle.allFeathureStyle,
                ),
              ),
              const SizedBox(height: 20),

              // عرض الفئات
              Builder(
                builder: (_) {
                  if (state is CategoriesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CategoriesLoaded) {
                    return SizedBox(
                      height: 110,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children:
                            cubit.categories.map((category) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Image.network(
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
                  } else if (state is CategoriesError) {
                    return Center(child: Text(state.message));
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),

              const SizedBox(height: 20),
              const PromoSlider(),
              const SizedBox(height: 20),

              Text(
                'Recommended',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  height: 22 / 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),

              Builder(
                builder: (_) {
                  if (state is ProductsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ProductsLoaded) {
                    return Column(
                      children:
                          state.products.map((product) {
                            return Card(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: ListTile(
                                leading: Image.network(
                                  product.image,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                                title: Text(product.name),
                                subtitle: Text(product.description),
                                trailing: Text('${product.price} \$'),
                              ),
                            );
                          }).toList(),
                    );
                  } else if (state is ProductsError) {
                    return Center(child: Text(state.message));
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget _buildSvgIcon(String assetPath, int index, int currentIndex) {
  return SvgPicture.asset(
    assetPath,
    width: 24,
    height: 24,
    colorFilter: ColorFilter.mode(
      currentIndex == index ? const Color(0xFFF83758) : Colors.black,
      BlendMode.srcIn,
    ),
  );
}
