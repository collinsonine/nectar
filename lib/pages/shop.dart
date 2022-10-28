import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:nectar/classes/colors.dart';
import 'package:nectar/main.dart';

class ShopPage extends StatefulWidget {
  final String email;

  ShopPage({super.key, required this.email});
  final colors = MyColors();
  @override
  State<ShopPage> createState() => _ShopPageState();
}

const Map myMap = {
  'item_name': [
    'Organic Banana',
    'Chicken',
    'Beef',
    'Bitroot',
    'Fish',
    'Bell Pepper',
    'Coka Cola',
    'Apple Juice'
  ],
  'item_price': [
    '2000',
    '5000',
    '4000',
    '1000',
    '4500',
    '3200',
    '10000',
    '1800'
  ],
  'image_url': [
    'assets/images/banana.jpg',
    'assets/images/chicken.jpg',
    'assets/images/beef.jpg',
    'assets/images/bitroot.jpg',
    'assets/images/fish.jpg',
    'assets/images/item.jpg',
    'assets/images/coke.jpg',
    'assets/images/applejuice.jpg'
  ]
};
const Map myCategories = {
  'item_name': [
    'Pulses',
    'Rice',
  ],
  'image_url': [
    'assets/images/pulses.png',
    'assets/images/rice.png',
  ]
};

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/pagebg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 20, right: 20, top: 70),
              child: FaIcon(
                FontAwesomeIcons.carrot,
                size: 25,
                color: colors.success,
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 80, right: 20),
              child: ListTile(
                minLeadingWidth: 1,
                minVerticalPadding: 1,
                leading: const Icon(
                  IconlyLight.user,
                  color: Colors.black,
                ),
                title: Text(
                  widget.email,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                decoration: const InputDecoration(
                  fillColor: Color.fromARGB(255, 124, 124, 124),
                  contentPadding: EdgeInsets.all(20),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 30, right: 10),
                    child: Icon(
                      IconlyLight.search,
                      color: Colors.black,
                    ),
                  ),
                  iconColor: Colors.black,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: 'Search Store',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: CarouselSlider(
                options: CarouselOptions(height: 120.0, autoPlay: true),
                items: [1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: const BoxDecoration(
                              color: Colors.transparent,
                              image: DecorationImage(
                                  image: AssetImage("assets/images/banner.jpg"),
                                  fit: BoxFit.fill)),
                          child: const Text(''));
                    },
                  );
                }).toList(),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ListTile(
                title: const Text(
                  'Executive Offer',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  'See all',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: colors.success),
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                      height: 260, viewportFraction: 0.5, disableCenter: true),
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          child: Image.asset(
                            myMap['image_url'][itemIndex],
                            height: 100,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            myMap['item_name'][itemIndex],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text('7pcs, Priceg'),
                        ),
                        ListTile(
                            title: Text(
                              "N${myMap['item_price'][itemIndex]}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: IconButton(
                              onPressed: (() {}),
                              icon: Icon(
                                IconlyLight.plus,
                                color: colors.success,
                                size: 30,
                              ),
                            )),
                      ],
                    ),
                  ),
                )),
            bestSelling(),
            categories(),
          ],
        ),
      )),
      bottomNavigationBar:
          BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(IconlyLight.buy),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          icon: Icon(IconlyLight.search),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(IconlyLight.heart),
          label: 'Favourite',
        ),
      ]),
    );
  }
}

bestSelling() {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListTile(
          title: const Text(
            'Best Selling',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          trailing: Text(
            'See all',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: colors.success),
          ),
        ),
      ),
      Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: CarouselSlider.builder(
            options: CarouselOptions(
                height: 260,
                viewportFraction: 0.5,
                disableCenter: true,
                reverse: true),
            itemCount: 8,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Card(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Image.asset(
                      myMap['image_url'][itemIndex],
                      height: 100,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      myMap['item_name'][itemIndex],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('7pcs, Priceg'),
                  ),
                  ListTile(
                      title: Text(
                        "N${myMap['item_price'][itemIndex]}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: IconButton(
                        onPressed: (() {}),
                        icon: Icon(
                          IconlyLight.plus,
                          color: colors.success,
                          size: 30,
                        ),
                      )),
                ],
              ),
            ),
          ))
    ],
  );
}

categories() {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListTile(
          title: const Text(
            'Categories',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          trailing: Text(
            'See all',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: colors.success),
          ),
        ),
      ),
      Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: CarouselSlider.builder(
            options: CarouselOptions(
                height: 140,
                viewportFraction: 0.6,
                disableCenter: false,
                reverse: true),
            itemCount: 2,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Card(
              color: const Color.fromARGB(255, 122, 204, 152),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 30, bottom: 30),
                    child: ListTile(
                      leading: Image.asset(
                        myCategories['image_url'][itemIndex],
                        height: 100,
                      ),
                      title: Text(
                        myCategories['item_name'][itemIndex],
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
            ),
          )),
      Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: CarouselSlider.builder(
            options: CarouselOptions(
                height: 260,
                viewportFraction: 0.5,
                disableCenter: true,
                reverse: true),
            itemCount: 8,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Card(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Image.asset(
                      myMap['image_url'][itemIndex],
                      height: 100,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      myMap['item_name'][itemIndex],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('7pcs, Priceg'),
                  ),
                  ListTile(
                      title: Text(
                        "N${myMap['item_price'][itemIndex]}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: IconButton(
                        onPressed: (() {}),
                        icon: Icon(
                          IconlyLight.plus,
                          color: colors.success,
                          size: 30,
                        ),
                      )),
                ],
              ),
            ),
          ))
    ],
  );
}
