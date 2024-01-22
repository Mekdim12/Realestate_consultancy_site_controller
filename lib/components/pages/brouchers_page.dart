import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class BrouchersPage extends StatefulWidget {
  const BrouchersPage({super.key});

  @override
  State<BrouchersPage> createState() => _BrouchersPageState();
}

class BrouchersData{
  String nameOfTheFile="";
  String typeOfTheFile="";
  int numberLabel = 1;
}

class _BrouchersPageState extends State<BrouchersPage> {
  // fall back as place holder for image slider in brouchers page
  final list_of_brouchers_of_offers = [
    "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/3646108/pexels-photo-3646108.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/3879065/pexels-photo-3879065.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/1841120/pexels-photo-1841120.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/3608542/pexels-photo-3608542.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/3786092/pexels-photo-3786092.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/3166786/pexels-photo-3166786.jpeg?auto=compress&cs=tinysrgb&w=600"
  ];
  //  local dev place for slider image when working with no internet
  final list_of_brouchers_of_offers_local = [
    AssetImage('assets/images/not_found.png'),
    AssetImage('assets/images/not_found.png'),
    AssetImage('assets/images/not_found.png'),
    AssetImage('assets/images/not_found.png'),
    AssetImage('assets/images/not_found.png'),
    AssetImage('assets/images/not_found.png'),
    AssetImage('assets/images/not_found.png')
  ];

  @override
  Widget build(BuildContext context) {
    bool is_image_available = list_of_brouchers_of_offers.length > 0;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add),
      ),
      body: is_image_available
          ? Container(
              margin: const EdgeInsets.symmetric(horizontal:10, vertical: 20 ),
              child: CarouselSlider.builder(
                options: CarouselOptions(
                    autoPlay: true,
                    autoPlayAnimationDuration:const  Duration(milliseconds: 500),
                    autoPlayCurve: Curves.easeIn,
                    height: 200,
                    enlargeCenterPage: true,
                    viewportFraction: 0.6),
                itemCount: list_of_brouchers_of_offers.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 2.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                         image: DecorationImage(
                            image:list_of_brouchers_of_offers_local[itemIndex],
                            fit: BoxFit.fitWidth),
                            ),
                  );
                },
              ))
          : SizedBox(
              width: double.infinity,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 105,
                      height: 105,
                      margin: const EdgeInsets.only(top: 10),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          // no item found sad search message
                          image: AssetImage('assets/images/not_found.png'),
                        ),
                      )),
                  const Text(
                    "No Brouchers Found",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
    );
  }
}
