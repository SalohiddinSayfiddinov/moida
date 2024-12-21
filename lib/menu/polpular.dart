import 'package:flutter/material.dart';

class Polpular extends StatelessWidget {
  const Polpular({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0).copyWith(right: 0),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 220,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(right: 16.0, bottom: 16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQErkNKMmH0WUulsuEIXxlBzENBKEhcjAkl0g&s'),
              const Text(
                'Hot burger',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Taste our burger',
                style: TextStyle(fontSize: 13),
              ),
              const SizedBox(height: 8.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$10",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.add, color: Colors.red)
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
