class PropertyVehiclesData{

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


  const PropertyVehiclesData({
    required this.city,
    required this.subCity,
    required this.description,
    required this.unitsAvailabel,
    required this.neighborhoodOrStreetName,
    required this.buildingFloors,
    required this.pricePerSq,
    required this.numberOfBedrooms,


  });
}


class PropertyRealstateData{


}

status = models.CharField(max_length=100)
real_state_company_name = models.CharField(max_length=100)