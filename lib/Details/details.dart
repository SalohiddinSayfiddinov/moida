import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moida/cubit/cubit_plus.dart';

class DetailsScreen extends StatelessWidget {
  final String name;
  final String price;
  const DetailsScreen({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: width < 950
            ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 15,
                            offset: Offset(5, 5),
                          ),
                        ],
                      ),
                      height: 250,
                      clipBehavior: Clip.hardEdge,
                      child: Image.network(
                        "https://static.insales-cdn.com/images/products/1/8159/524238815/LIS_4318.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Description(name: name, price: price),
                  ],
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 15,
                          offset: Offset(5, 5),
                        ),
                      ],
                    ),
                    height: 250,
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(
                      "https://static.insales-cdn.com/images/products/1/8159/524238815/LIS_4318.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 50),
                  Description(name: name, price: price),
                ],
              ),
      ),
    );
  }
}

class Description extends StatelessWidget {
  final String name;
  final String price;
  const Description({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (MediaQuery.of(context).size.width < 950)
            const SizedBox(height: 30),
          Text(
            name,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "This juicy, gourmet burger is crafted from premium beef, topped with fresh veggies, melted cheese, and our special sauce, all sandwiched in a freshly baked brioche bun. It's the ultimate burger experience for anyone craving something rich and flavorful.",
            style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                fontStyle: FontStyle.italic,
                height: 1.6),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Text(
            price,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CountChanger(),
              const SizedBox(width: 20),
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.orangeAccent, Colors.red],
                  ),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 19,
                  horizontal: 35,
                ),
                child: const Text(
                  "Add to cart",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CountChanger extends StatelessWidget {
  const CountChanger({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(2, 2))
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: context.read<PlusCubit>().minusOne,
            icon: const Icon(Icons.remove),
          ),
          BlocBuilder<PlusCubit, int>(
            builder: (BuildContext context, int state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  state.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
          IconButton(
            onPressed: context.read<PlusCubit>().plusOne,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
