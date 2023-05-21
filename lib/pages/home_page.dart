import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui/animations/fade_animation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_basket,
              color: Colors.grey[800],
            ),
          ),
        ],
        leading: const Icon(
          null,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeAnimation(
                    delay: 1,
                    child: Text(
                      'Food Delivery',
                      style: TextStyle(
                        color: Colors.grey[80],
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        FadeAnimation(
                          delay: 1,
                          child: makeCategory(
                            isActive: true,
                            title: 'Pizza',
                          ),
                        ),
                        FadeAnimation(
                          delay: 1.1,
                          child: makeCategory(
                            isActive: false,
                            title: 'Burgers',
                          ),
                        ),
                        FadeAnimation(
                          delay: 1.2,
                          child: makeCategory(
                            isActive: false,
                            title: 'Kebab',
                          ),
                        ),
                        FadeAnimation(
                          delay: 1.3,
                          child: makeCategory(
                            isActive: false,
                            title: 'Desert',
                          ),
                        ),
                        FadeAnimation(
                          delay: 1.4,
                          child: makeCategory(
                            isActive: false,
                            title: 'Salad',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            FadeAnimation(
              delay: 1,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Free Delivery',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    FadeAnimation(
                      delay: 1.4,
                      child: makeItem(
                        image: 'assets/images/one.jpg',
                      ),
                    ),
                    FadeAnimation(
                      delay: 1.5,
                      child: makeItem(
                        image: 'assets/images/two.jpg',
                      ),
                    ),
                    FadeAnimation(
                      delay: 1.6,
                      child: makeItem(
                        image: 'assets/images/three.jpg',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget makeCategory({isActive, title}) {
    return AspectRatio(
      aspectRatio: isActive ? 3 : 2.5 / 1,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: isActive ? Colors.yellow[700] : Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.grey[500],
              fontSize: 18,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w100,
            ),
          ),
        ),
      ),
    );
  }

  Widget makeItem({image}) {
    return AspectRatio(
      aspectRatio: 1 / 1.8,
      child: GestureDetector(
        child: Container(
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(
                image,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                stops: const [.2, .9],
                colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.3),
                ],
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\$ 15.00',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Vegetarian Pizza',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
