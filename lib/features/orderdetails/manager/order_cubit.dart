import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/features/orderdetails/data/repo/oeder_repo.dart';
import 'package:shop/features/orderdetails/manager/order_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepo ordersRepo;

  OrdersCubit(this.ordersRepo) : super(OrdersInitial());

  Future<void> fetchOrders() async {
    emit(OrdersLoading());

    try {
      final orders = await ordersRepo.getOrders();
      emit(OrdersLoaded(orders));
    } catch (e) {
      emit(OrdersError(e.toString()));
    }
  }
}
