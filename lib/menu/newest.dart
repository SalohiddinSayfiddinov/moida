import 'package:flutter/material.dart';

class Newest extends StatelessWidget {
  const Newest({super.key});

  @override
  Widget build(BuildContext context) {
        return SingleChildScrollView(
      scrollDirection: Axis.horizontal,child: Padding(padding: 
      const EdgeInsets.symmetric(horizontal: 5,vertical: 15),
      child: Row(children: [
        Padding(padding: const EdgeInsets.symmetric(horizontal: 7
        ),child: Container(
          width: 570,height: 225,decoration: BoxDecoration(color: Colors.white,borderRadius: 
          BorderRadius.circular(20)
          ),child: Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(children: [
            Container(child: Row(
              children: [
                Image.network(   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQErkNKMmH0WUulsuEIXxlBzENBKEhcjAkl0g&s',height: 200),SizedBox(width: 20,),
                Column(
                  children: [
                    Text('Pizhmdrnwdimwee'),SizedBox(height: 3,),              Text('Pizhmdrnwdimwee'),SizedBox(height: 3,),              Text('Pizhmdrnwdimwee'),SizedBox(height: 3,),              Text('Pizhmdrnwdimwee'),SizedBox(height: 3,)
                                 , Text('Pizhmdrnwdimwee'),SizedBox(height: 3,),              Text('Pizhmdrnwdimwee'),SizedBox(height: 3,)
             ,              Text('Pizhmdrnwdimwee'),SizedBox(height: 3,),              Text('Pizhmdrnwdimwee'),SizedBox(height: 3,),              Text('Pizhmdrnwdimwee'),SizedBox(height: 3,)     ],
                )
              ],
            )
        ),
          
        
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