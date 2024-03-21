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
  final String propertyImage;

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
  });
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
  final String vehicleImage;

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
  });
}
