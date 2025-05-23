import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/features/orderdetails/manager/order_cubit.dart';
import 'package:shop/features/orderdetails/manager/order_state.dart';

import 'package:shop/features/orderdetails/view/order_items.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  String selectedStatus = "Active";

  @override
  void initState() {
    super.initState();

    context.read<OrdersCubit>().fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Orders'), centerTitle: true),
      body: Column(
        children: [
          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildFilterButton("Active"),
              buildFilterButton("Completed"),
              buildFilterButton("Canceled"),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: BlocBuilder<OrdersCubit, OrdersState>(
              builder: (context, state) {
                if (state is OrdersLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is OrdersError) {
                  return Center(child: Text('Error: ${state.message}'));
                } else if (state is OrdersLoaded) {
                  final filteredOrders =
                      state.orders
                          .where((order) => order.status == selectedStatus)
                          .toList();

                  if (filteredOrders.isEmpty) {
                    return Center(
                      child: Text(
                        "You don't have any $selectedStatus orders at this time",
                        style: const TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: filteredOrders.length,
                    itemBuilder: (context, index) {
                      return OrderItem(order: filteredOrders[index]);
                    },
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFilterButton(String status) {
    final isSelected = selectedStatus == status;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedStatus = status;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue : Colors.grey.shade300,
          foregroundColor: isSelected ? Colors.white : Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(status),
      ),
    );
  }
}
