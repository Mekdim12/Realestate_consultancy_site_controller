import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class BrouchersPage extends StatefulWidget {
  const BrouchersPage({super.key});

  @override
  State<BrouchersPage> createState() => _BrouchersPageState();
}

class BrouchersData{
  final String nameOfTheFile; // tittle
  final String filePath; // image
  final String descritpion; // description
  final String  type; // type
  
  const BrouchersData({
    required this.nameOfTheFile,
    required this.descritpion,
    required this.filePath,
    required this.type
  });
}

class _BrouchersPageState extends State<BrouchersPage> {
  // fall back as place holder for image slider in brouchers page
  // final list_of_brouchers_of_offers = [
  //   "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?auto=compress&cs=tinysrgb&w=600",
  //   "https://images.pexels.com/photos/3646108/pexels-photo-3646108.jpeg?auto=compress&cs=tinysrgb&w=600",
  //   "https://images.pexels.com/photos/3879065/pexels-photo-3879065.jpeg?auto=compress&cs=tinysrgb&w=600",
  //   "https://images.pexels.com/photos/1841120/pexels-photo-1841120.jpeg?auto=compress&cs=tinysrgb&w=600",
  //   "https://images.pexels.com/photos/3608542/pexels-photo-3608542.jpeg?auto=compress&cs=tinysrgb&w=600",
  //   "https://images.pexels.com/photos/3786092/pexels-photo-3786092.jpeg?auto=compress&cs=tinysrgb&w=600",
  //   "https://images.pexels.com/photos/3166786/pexels-photo-3166786.jpeg?auto=compress&cs=tinysrgb&w=600"
  // ];

  //  local dev place for slider image when working with no internet
  final list_of_brouchers_of_offers = [
    AssetImage('assets/images/not_found.png'),
    AssetImage('assets/images/not_found.png'),
    AssetImage('assets/images/not_found.png'),
    AssetImage('assets/images/not_found.png'),
    AssetImage('assets/images/not_found.png'),
    AssetImage('assets/images/not_found.png'),
    AssetImage('assets/images/not_found.png')
  ];

  final listOfBroucherItems = [
   const BrouchersData(
      nameOfTheFile:"Mekdim Tamirat",
      filePath:"assets/images/not_found.png",
      descritpion: "This lorem Ipsum Identification",
      type:"main"
    ),  
    const BrouchersData(
     nameOfTheFile:"Etsub Tamirat",
      filePath:"assets/images/not_found.png",
      descritpion: "This lorem Ipsum Identification",
      type :"other"
    ),
    const BrouchersData(
     nameOfTheFile:"Etsub Tamirat",
      filePath:"assets/images/not_found.png",
      descritpion: "This lorem Ipsum Identification",
      type :"other"
    ),
     const BrouchersData(
     nameOfTheFile:"Etsub Tamirat",
      filePath:"assets/images/not_found.png",
      descritpion: "This lorem Ipsum Identification",
      type :"other"
    ),
     const BrouchersData(
     nameOfTheFile:"Etsub Tamirat",
      filePath:"assets/images/not_found.png",
      descritpion: "This lorem Ipsum Identification",
      type :"other"
    ),
     const BrouchersData(
     nameOfTheFile:"Etsub Tamirat",
      filePath:"assets/images/not_found.png",
      descritpion: "This lorem Ipsum Identification",
      type :"other"
    ),
     const BrouchersData(
     nameOfTheFile:"Etsub Tamirat",
      filePath:"assets/images/not_found.png",
      descritpion: "This lorem Ipsum Identification",
      type :"other"
    ),
   
  ];

  @override
  Widget build(BuildContext context) {
    bool is_image_available = list_of_brouchers_of_offers.length > 0;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add),
      ),
      body: is_image_available
          ? Column(
            children: [
             Container(
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
                            image:list_of_brouchers_of_offers[itemIndex],
                            fit: BoxFit.fitWidth),
                            ),
                  );
                },
              )) ,
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: screenHeight - 400,
                child: ListView.builder(
                  itemCount:listOfBroucherItems.length,
                  itemBuilder: (context, index){
                    print("xxxxxxxxxxxxxx");
                    return ListTile(
                      title: Text("Mekdim TAMIRAT"),
                      subtitle : Text("sibSDFSDF"),
                      trailing: Icon(Icons.arrow_forward),
                    );
                  }
                  ) ,
              )
   ] )
          : SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 105,
                      height: 105,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          // no item found sad search message
                          image: AssetImage('assets/images/not_found.png'),
                        ),
                      )),
                  const Text(
                    "No Brouchers Found +",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
    );
  }
}
