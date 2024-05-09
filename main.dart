import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Shoes',
            style: TextStyle(
              color: Color.fromARGB(255, 75, 75, 75),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQA8cTn1-RRcQ_T4-cf40vYi4sjFEADIdog1TqwvXO3kw&s'), // Ganti dengan path foto profil
              ),
            ),
          ],
        ),
        body: ShoesListApp(),
      ),
    );
  }
}

class ShoesListApp extends StatelessWidget {
  final List<Map<String, dynamic>> shoesList = [
    {
      'name': 'Nike Zoom M2',
      'deskripsi': 'Nike Premium 20352',
      'imagePath': 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pngwing.com%2Fen%2Fsearch%3Fq%3Dnike%2Bshoes&psig=AOvVaw005Y8J9KlXVIMxlRStlzfp&ust=1715351212491000&source=images&cd=vfe&opi=89978449&ved=2ahUKEwiBx-Cu44CGAxUma2wGHR1NBMcQjRx6BAgAEBY',
    },
    {
      'name': 'Adidas Shoes',
      'deskripsi': 'New Adidas Black mat ',
      'imagePath': 'https://e7.pngegg.com/pngimages/301/890/png-clipart-adidas-samba-classic-indoor-soccer-shoe-white-black-sports-shoes-adidas-men-s-samba-adidas-samba.png',
    },
    {
      'name': 'Puma Shoes',
      'deskripsi': 'Puma Original Rb',
      'imagePath': 'https://banner2.cleanpng.com/20180427/dve/kisspng-sneakers-white-skate-shoe-clothing-chalk-gray-5ae2d4e33f85e9.1798478615248150752602.jpg',
    },
    {
      'name': 'Reebok Shoes',
      'deskripsi': 'Rebook Original 2253',
      'imagePath': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_uevAkWH9zdn5X8qy8QM8hMQHYoYZ9xnV2HKEj43YWw&s',
    },
    {
      'name': 'New Balance Shoes',
      'deskripsi': 'Vans Original Vietnam',
      'imagePath': 'https://e1.pngegg.com/pngimages/87/482/png-clipart-aesthetic-red-and-blue-new-balance-shoe.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: shoesList.length,
      itemBuilder: (context, index) {
        final shoes = shoesList[index];
        return ShoesCard(
          name: shoes['name'],
          deskripsi: shoes['deskripsi'],
          imagePath: shoes['imagePath'],
        );
      },
    );
  }
}

class ShoesCard extends StatelessWidget {
  final String? name;
  final String? deskripsi;
  final String? imagePath;
  final Color backgroundColor;

  const ShoesCard({
    Key? key,
    this.name,
    this.deskripsi,
    this.imagePath,
    this.backgroundColor = const Color.fromARGB(255, 234, 120, 5), // Default background color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name ?? '',
                style: const TextStyle(
                  color: Color.fromARGB(255, 75, 75, 75),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                deskripsi ?? '',
                style: const TextStyle(
                  color: Color.fromARGB(255, 75, 75, 75),
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: Image.network(
              imagePath ?? '',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
