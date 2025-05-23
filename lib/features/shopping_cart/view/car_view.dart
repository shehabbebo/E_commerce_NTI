import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/app_style.dart';
import 'package:shop/features/weight/cart_details/cart_item.dart';
import 'package:shop/features/weight/cart_details/cart_item_weight.dart';
import 'package:shop/features/weight/cart_details/checkout.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> cartItems = [
    CartItem(
      name: 'Women’s Casual Wear ',
      price: 34.0,
      oldPrice: 50.0,
      rating: 4.5,
      quantity: 1,
      image: AppAssets.photocart1,
    ),
    CartItem(
      name: 'Men’s Jacket ',
      price: 45.0,
      oldPrice: 60.0,
      rating: 4.2,
      quantity: 2,
      image: AppAssets.photocart2,
    ),
  ];

  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));

  void increaseQuantity(CartItem item) {
    setState(() => item.quantity++);
  }

  void decreaseQuantity(CartItem item) {
    setState(() {
      if (item.quantity > 1) {
        item.quantity--;
      } else {
        cartItems.remove(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: AppTextStyle.appbarstylr),
        centerTitle: true,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: SvgPicture.asset(
            AppAssets.arrowback,
            width: 11,
            height: 11,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
      body:
          cartItems.isEmpty
              ? Center(child: Text('Your cart is empty!'))
              : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Shopping List',
                        style: TextStyle(
                          fontFamily: AppAssets.fontfamily,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          final item = cartItems[index];
                          return CartItemWidget(
                            item: item,
                            onIncrease: () => increaseQuantity(item),
                            onDecrease: () => decreaseQuantity(item),
                          );
                        },
                      ),
                    ),
                    Divider(),
                    CheckoutSection(totalPrice: totalPrice),
                  ],
                ),
              ),
    );
  }
}
