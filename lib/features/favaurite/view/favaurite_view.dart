import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/features/home/manager/home_cubit.dart';

class MyFavScreen extends StatelessWidget {
  const MyFavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProducts = context.watch<HomeCubit>().favoriteProducts;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: SvgPicture.asset(AppAssets.arrowback, fit: BoxFit.scaleDown),
        ),
        centerTitle: true,
        title: Text('My Favorites', style: AppTextStyle.appbarstylr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(23.0),
        child:
            favoriteProducts.isEmpty
                ? const Center(child: Text("لا توجد منتجات مفضلة"))
                : ListView.builder(
                  itemCount: favoriteProducts.length,
                  itemBuilder: (context, index) {
                    final product = favoriteProducts[index];
                    return ListTile(
                      leading: Image.network(product.image, width: 50),
                      title: Text(product.name),
                      subtitle: Text("${product.price} EGP"),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: product.isFavorite ? Colors.red : Colors.grey,
                        ),
                        onPressed: () {
                          context.read<HomeCubit>().toggleFavorite(product);
                        },
                      ),
                    );
                  },
                ),
      ),
    );
  }
}
