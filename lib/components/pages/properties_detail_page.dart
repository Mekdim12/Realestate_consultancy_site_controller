import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../models/properties.dart';

class PropertiesDetailPage extends StatefulWidget {
  final propertyObject;
 

  const PropertiesDetailPage(this.propertyObject, {super.key});

  @override
  State<PropertiesDetailPage> createState() => _PropertiesDetailPageState();
}


class _PropertiesDetailPageState extends State<PropertiesDetailPage> {
  int selectedImageIndex= 0;
   
  Widget viewBuilder(dynamic propertyObject){
    final Widget returnWidget;
    
   

    if(propertyObject is PropertyVehiclesData){
      final listOfImages = propertyObject.vehicleImage;
       setState(() {
          propertyObject = propertyObject;
      });
      returnWidget = Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Property Detail"),
        ),
        actions: [
          ElevatedButton.icon(onPressed: (){

          }, icon: const Icon(Icons.delete, ), label: Text(""), style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.purple)),)
        ],
      ),
      body: Column(
        children: [
          Container(
            child:  CarouselSlider.builder(
                            options: CarouselOptions(
                              onPageChanged: (index, reason) {
                              //   delete the image by sending delete the request here have it in state first 
                              setState(() {
                                selectedImageIndex = index;
                              });
                              },
                                height: 200,
                                enlargeCenterPage: true,
                                viewportFraction: 0.8),
                            itemCount: listOfImages.length,
                            itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) {
                              return Container(
                                width: double.infinity,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          listOfImages[itemIndex]
                                              ),
                                      fit: BoxFit.fitWidth),
                                ),
                              );
                            },
                          ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: 35,
            child: ElevatedButton.icon(onPressed: (){
              print("Pressed Item ${selectedImageIndex}");
            }, icon: const Icon(Icons.delete_forever,color:Colors.red), label:const Text("Delete"), style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(Color.fromARGB(113, 155, 39, 176)),),),
          )
        ],
      )
    );
    }else{ 
        returnWidget = Center(child: Text("dssfdfsd"),);
    }
    return returnWidget;
  }

  @override
  Widget build(BuildContext context) {
    final propertyObject = widget.propertyObject;
    
    return viewBuilder(propertyObject);
  }
}
