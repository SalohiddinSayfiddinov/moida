import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moida/cart/model_cubit.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child:
          BlocBuilder<CartCubit, CartState>(builder: (context, currentIndex) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('Cart',
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.read<CartCubit>().resetCart(),
             iconSize: 30,
            ),
          ),
          body: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state.quantity <= 0) {
                return const Center(
                  child: Text(
                    "SAVAT BO'SH !",
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/4x.jpg',
                        height: 350,
                      ),
                    ),
                    const Text(
                      "4 Friends Лестер чиз",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Лестер чиз 4 шт.\nKypиныe шарики c сыром 12 шт.',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 45),
                    Row(
                      children: [
                        Text(
                          '${state.totalPrice} \nсум',
                          style: const TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Container(
                            padding: const EdgeInsets.all(0.01),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 0.1),
                                borderRadius: BorderRadius.circular(16)),
                            child: Row(
                            children: [ 
                              IconButton(
                                icon: const Icon(Icons.remove),
                                color: Colors.black,
                                onPressed: () =>
                                    context.read<CartCubit>().decrement(),
                              ),
                              Text(
                                '${state.quantity}',
                                style: const TextStyle(fontSize: 18),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add),
                                color: Colors.black,
                                onPressed: () =>
                                    context.read<CartCubit>().increment(),
                              ),
                            ]))
                      ],
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                       style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  minimumSize: const Size(double.infinity, 50),
                ),
                      child: const Text('Добавлено',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
