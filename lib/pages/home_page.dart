import 'package:flutter/material.dart';
import 'package:uts_ui/tiles/coffe.tiles.dart';
import 'package:uts_ui/tiles/coffe_type.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key, required String namevar }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of coffe types
  final List coffeType = [
      // [ coffe type, isSelected ]
      ['Cappucino', true,],
      ['Latte', false,],
      ['Espresso', false,],
    ];

  // user tapped on coffe types
  void coffetypeSelected(int index) {
    setState(() {

      // this for loop makes every selection false
      for (int i = 0; i < coffeType.length; i++) {
        coffeType[i][1] = false;
      }
      coffeType[index][1] = true;
      
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar (
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
            )
        ],
        ),
      body: Column(children: [
        // Find the best coffee for you
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            "Find the best coffee for you",
            style: GoogleFonts.bebasNeue(
              fontSize: 56,
            ),
          ),
        ), 
        
        SizedBox(height: 25),

        // search Bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Find your best coffee..',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
        ),

        SizedBox(height: 25),

        // horizontal listveiw of coffee type
        Container(
          height: 50,
          child: ListView.builder(
            itemCount: coffeType.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
            
            return Coffetype(
              coffetype: coffeType[index][0],
              isSelected: coffeType[index][1], 
              onTap: (){coffetypeSelected(index);},
              );
  }),
      ),


        // horinzontal listview of coffee tiles
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CoffeeTile(
                coffeImagePath: 'lib/images/coffe1.jpeg',
                coffeName: 'Latte',
                coffePrice: '25.000',
              ),
              CoffeeTile(
                coffeImagePath: 'lib/images/Cappucino.jpeg',
                coffeName: 'Cappucino',
                coffePrice: '20.000',
              ),
              CoffeeTile(
                coffeImagePath: 'lib/images/Espresso.jpeg',
                coffeName: 'Espresso',
                coffePrice: '30.000',
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class CoffeTile {
}