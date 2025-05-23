import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/features/orderdetails/data/model/order_model.dart';

class OrdersRepo {
  Future<List<OrderModel>> getOrders() async {
    await Future.delayed(Duration(seconds: 1));

    List<OrderModel> orders = [
      OrderModel(
        id: '1',
        name: "Men's T-Shirt",
        price: 50.0,
        image: AppAssets.tshirt,
        status: 'Active',
        date: DateTime(2023, 5, 15, 13, 30),
        quantity: 1,
      ),
      OrderModel(
        id: '2',
        name: "Women’s Jacket",
        price: 120.0,
        image: AppAssets.tshirt,
        status: 'Completed',
        date: DateTime(2023, 4, 10, 16, 00),
        quantity: 1,
      ),
      OrderModel(
        id: '3',
        name: "Sports Shoes",
        price: 75.0,
        image: AppAssets.tshirt,
        status: 'Canceled',
        date: DateTime(2023, 3, 20, 11, 15),
        quantity: 1,
      ),
      OrderModel(
        id: '4',
        name: "Backpack",
        price: 45.0,
        image: AppAssets.tshirt,
        status: 'Active',
        date: DateTime(2023, 6, 1, 10, 45),
        quantity: 1,
      ),
    ];

    return orders;
  }
}
