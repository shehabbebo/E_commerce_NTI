import 'package:flutter/material.dart';
import 'package:shop/core/utils/app_colors.dart';
import 'package:shop/core/utils/app_style.dart';
import 'package:shop/features/weight/cart_details/sammery_row.dart';

class CheckoutSection extends StatelessWidget {
  final double totalPrice;

  const CheckoutSection({Key? key, required this.totalPrice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          SummaryRow(title: 'Subtotal', value: totalPrice),
          SummaryRow(title: 'Tax and Fees', value: 3.0),
          SummaryRow(title: 'Delivery Fee', value: 2.0),
          Divider(color: Color(0xFFCACACA), thickness: 1.0),
          SummaryRow(
            title: 'Order Total',
            value: totalPrice + 5.0,
            isTotal: true,
          ),
          SizedBox(height: 16),
          SizedBox(
            width: 327,
            height: 52,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(AppColor.onboardingbtn),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: Text('Checkout', style: AppTextStyle.catrbtn),
            ),
          ),
        ],
      ),
    );
  }
}
