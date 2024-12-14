import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moida/cubit/cubit_plus.dart';
import 'package:moida/details/details.dart';
import 'package:moida/cart/cart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = [
    "Pizza",
    "Burgers",
    "Sushi",
    "Pasta",
    "Desserts"
  ];

  final Map<String, List<Map<String, String>>> foodItems = {
    "Pizza": [
      {"name": "Pepperoni", "price": "140000 so'm"},
      {"name": "Margarita", "price": "140000 so'm"},
      {"name": "Chickenpizza", "price": "140000 so'm"},
      {"name": "Hawaiian", "price": "100000 so'm"},
      {"name": "Veggie", "price": "90000 so'm"},
      {"name": "Four Cheese", "price": "130000 so'm"},
    ],
    "Burgers": [
      {"name": "Cheeseburger", "price": "14000 so'm"},
      {"name": "Hamburger", "price": "14000 so'm"},
      {"name": "Chickenburger", "price": "14000 so'm"},
      {"name": "Doublecheeseburger", "price": "10000 so'm"},
      {"name": "Veganburger", "price": "9000 so'm"},
      {"name": "Blackburger", "price": "13000 so'm"},
    ],
    "Sushi": [
      {"name": "California", "price": "14000 so'm"},
      {"name": "Roll", "price": "14000 so'm"},
      {"name": "Temaki", "price": "14000 so'm"},
      {"name": "Nigiri", "price": "10000 so'm"},
      {"name": "Uramaki", "price": "9000 so'm"},
      {"name": "Maki", "price": "13000 so'm"},
    ],
    "Pasta": [
      {"name": "Elbow", "price": "140000 so'm"},
      {"name": "Bucatini", "price": "140000 so'm"},
      {"name": "Spaghetti", "price": "140000 so'm"},
      {"name": "Farfalle", "price": "100000 so'm"},
      {"name": "Capellini", "price": "90000 so'm"},
      {"name": "Cavatappi", "price": "130000 so'm"},
    ],
    "Desserts": [
      {"name": "Cake", "price": "140000 so'm"},
      {"name": "Mochi", "price": "140000 so'm"},
      {"name": "Ice Cream", "price": "14000 so'm"},
      {"name": "Baklava", "price": "10000 so'm"},
      {"name": "Éclair", "price": "9000 so'm"},
      {"name": "Croissant", "price": "130000 so'm"},
    ],
  };

  String selectedCategory = "Pizza";
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredItems = foodItems[selectedCategory]!
        .where((item) =>
            item["name"]!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade200,
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Icon(Icons.search, color: Colors.grey),
                    ),
                    Expanded(
                      child: TextField(
                        cursorColor: Colors.grey,
                        decoration: const InputDecoration(
                          hintText: "Yaxshi korgan ovqatini tanla",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          setState(() {
                            searchQuery = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
                child: Row(
                  children: categories.map((category) {
                    return FoodCategoryButton(
                      title: category,
                      isSelected: selectedCategory == category,
                      onTap: () {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
            GridView.builder(
              padding: const EdgeInsets.all(16.0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                maxCrossAxisExtent: 240,
                mainAxisExtent: 230,
                childAspectRatio: 1,
              ),
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return FoodItemCard(
                  name: item["name"]!,
                  price: item["price"]!,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FoodCategoryButton extends StatelessWidget {
  const FoodCategoryButton(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.onTap});
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.grey : Colors.black,
          foregroundColor: isSelected ? Colors.black : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: isSelected ? 5 : 2,
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class FoodItemCard extends StatelessWidget {
  const FoodItemCard({super.key, required this.name, required this.price});
  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => PlusCubit(),
              child: DetailsScreen(name: name, price: price),
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        margin: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQErkNKMmH0WUulsuEIXxlBzENBKEhcjAkl0g&s",
                fit: BoxFit.cover,
                height: 125,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0).copyWith(bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          price,
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => CartPage(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.add_circle,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
