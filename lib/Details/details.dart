
import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:moida/cubit/cubit_plus.dart';


class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Image.network(
                "https://th.bing.com/th/id/OIP.RWaaZCnAJwE8O0FxwD7y0AHaEo?rs=1&pid=ImgDetMain",
                height: 300,
              ),
            ),
            Arc(
              edge: Edge.TOP,
              arcType: ArcType.CONVEY,
              height: 30,
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 60,
                          bottom: 10,
                        ),
                        child: Row(
                          children: [
                            RatingBar.builder(
                              initialRating: 4,
                              minRating: 1,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemSize: 18,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.red,
                              ),
                              onRatingUpdate: (index) {},
                            ),
                            Spacer(),
                            Text(
                              "\$10",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 10,
                          bottom: 20,
                        ),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Hot Pizza",
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Container(
                              width: 90,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () =>
                                        context.read<PlusCubit>().minusOne(),
                                    child: Icon(
                                      CupertinoIcons.minus,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  BlocBuilder<PlusCubit, int>(builder:
                                      (BuildContext context, int state) {
                                    return Text(
                                      state.toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    );
                                  }),
                                  InkWell(
                                    onTap: () =>
                                        context.read<PlusCubit>().plusOne(),
                                    child: Icon(
                                      CupertinoIcons.plus,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Taste Our Hot Pizza at low price,this is famous pizza  and you will love it.it will cost you at low price ,we hope you will enjoy and order many tames.",
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 10, right: 20, left: 20),
        child: Row(
          children: [
            Text(
              "Total:",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                onPressed: () {},
                child: Text(
                  "Order Now",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
