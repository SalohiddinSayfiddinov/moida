import 'package:flutter_bloc/flutter_bloc.dart';

class CartState {
  final int quantity;
  final int totalPrice;

  CartState({required this.quantity, required this.totalPrice});

}


//////


class CartCubit extends Cubit<CartState> {
  final int basePrice = 129000; 
  CartCubit() : super(CartState(quantity: 1, totalPrice: 129000));

  void increment() {
    emit(CartState(
      quantity: state.quantity + 1,
      totalPrice: (state.quantity + 1) * basePrice,
    ));
  }

  void decrement() {
    if (state.quantity > 1) {
      emit(CartState(
        quantity: state.quantity - 1,
        totalPrice: (state.quantity - 1) * basePrice,
      ));
    } else {
      emit(CartState(quantity: 0, totalPrice: 0));
    }
  }

  void resetCart() {
    emit(CartState(quantity: 1, totalPrice: basePrice));
  }
}