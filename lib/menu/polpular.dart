import 'package:flutter/material.dart';

class Polpular extends StatelessWidget {
  const Polpular({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,child: Padding(padding: 
      const EdgeInsets.symmetric(horizontal: 5,vertical: 15),
      child: Row(children: [for(int i = 0; i<6;i++)
        Padding(padding: const EdgeInsets.symmetric(horizontal: 7
        ),child: Container(
          width: 170,height: 225,decoration: BoxDecoration(color: Colors.white,borderRadius: 
          BorderRadius.circular(20)
          ),child: Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(children: [
            Container(child: Image.network(   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQErkNKMmH0WUulsuEIXxlBzENBKEhcjAkl0g&s',height: 130)
        ),const Text('Hot burger',style: TextStyle(fontWeight: FontWeight.bold),),
        const SizedBox(height: 4,),
        const Text('Taste our burger',style: TextStyle(fontSize: 15),),
        const SizedBox(height:12,),Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [Text("\$10",style: const TextStyle(fontSize: 17,color: Colors.red,
          fontWeight: FontWeight.bold)
          ,),Icon(Icons.favorite_border,color: Colors.red,size: 16,)
          ],
        )
         ],
        ),
        ),
        ),
        )
      ],
      ),
      ),
    );
  }
}