class PropertyRealstateData {
  final String city;
  final String subCity;
  final String description;
  final String unitsAvailabel;
  final String neighborhoodOrStreetName;
  final String buildingFloors;
  final String pricePerSq;
  final String numberOfBedrooms;
  final String lastUpdate;
  final String status;
  final String realstateCompanyName;
  final List propertyImage;
  final String id;

  const PropertyRealstateData({
    required this.city,
    required this.subCity,
    required this.description,
    required this.unitsAvailabel,
    required this.neighborhoodOrStreetName,
    required this.buildingFloors,
    required this.pricePerSq,
    required this.numberOfBedrooms,
    required this.lastUpdate,
    required this.status,
    required this.realstateCompanyName,
    required this.propertyImage,
    required this.id,
  });

  factory PropertyRealstateData.fromJson(Map<String, dynamic> json) {
    return PropertyRealstateData(
      propertyImage: json['propery_image'],
      city: json['city'],
      subCity: json['sub_city'],
      description: json['description'],
      unitsAvailabel: json['units_available'].toString(),
      neighborhoodOrStreetName: json['neighborhood_or_street_name'],
      buildingFloors: json['building_floors'].toString(),
      pricePerSq: json['price_per_sq'].toString(),
      numberOfBedrooms: json['number_of_bedrooms'].toString(),
      lastUpdate: json['last_update'],
      status: json['status'],
      realstateCompanyName: json['real_state_company_name'],
      id: json['id'].toString(),
    );
  }

  static List<PropertyRealstateData> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => PropertyRealstateData.fromJson(json))
        .toList();
  }
}

class PropertyVehiclesData {
  final String nameOfTheCar;
  final String color;
  final String plateNumberCity;
  final String description;
  final String unitsAvailabel;
  final String price;
  final String lastUpdate;
  final String userOrNew;
  final String status;
  final List vehicleImage;
  final String id;

  const PropertyVehiclesData({
    required this.nameOfTheCar,
    required this.color,
    required this.plateNumberCity,
    required this.description,
    required this.unitsAvailabel,
    required this.price,
    required this.lastUpdate,
    required this.userOrNew,
    required this.status,
    required this.vehicleImage,
    required this.id,
  });

  factory PropertyVehiclesData.fromJson(Map<String, dynamic> json) {
    return PropertyVehiclesData(
      vehicleImage: json['vehicle_image'],
      nameOfTheCar: json['name_of_the_car'],
      color: json['color'],
      plateNumberCity: json['plate_number_city'],
      description: json['description'],
      unitsAvailabel: json['units_available'].toString(),
      price: json['price'].toString(),
      lastUpdate: json['last_update'],
      userOrNew: json['used_or_new'],
      status: json['status'],
      id: json['id'].toString(),
    );
  }

  static List<PropertyVehiclesData> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => PropertyVehiclesData.fromJson(json)).toList();
  }
}
