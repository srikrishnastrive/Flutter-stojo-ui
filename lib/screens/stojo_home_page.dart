import 'package:flutter/material.dart';
import 'package:stojouiapp/model/model.dart';
import 'package:stojouiapp/screens/stojo_detail_screen.dart';

class StojoHomePage extends StatefulWidget {
  const StojoHomePage({super.key});

  @override
  State<StojoHomePage> createState() => _StojoHomePageState();
}

class _StojoHomePageState extends State<StojoHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Image.asset("images/menu1.png", height: 25),
                  const Spacer(),
                  Image.asset("images/search.png", height: 25),
                  const SizedBox(width: 15),
                  Image.asset("images/shopping bag.png", height: 25),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Trending',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 770,
              child: GridView.builder(
                itemCount: userItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.61,
                ),
                itemBuilder: (context, index) {
                  final stojo = userItems[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailStojo(stojo: stojo),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Container(
                            height: 270,
                            decoration: BoxDecoration(
                              color: stojo.color,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  CircleAvatar(
                                    radius: 65,
                                    backgroundColor: Colors.white,
                                  ),
                                  Hero(
                                    tag: "hero_${stojo.name}_$index",
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 25,
                                        left: 12,
                                      ),
                                      child: Image.asset(
                                        stojo.image,
                                        height: 180,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2, left: 20),
                          child: Text(
                            stojo.name,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            '\$${stojo.price}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
