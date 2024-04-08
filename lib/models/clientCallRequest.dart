class CallRequestedClient {
  final bool status;
  final String typeOfAnItem;
  final String id;
  final String clientName;
  final String clienEmail;
  final String phoneNumber;

  const CallRequestedClient(
      {required this.status,
      required this.typeOfAnItem,
      required this.id,
      required this.clientName,
      required this.clienEmail,
      required this.phoneNumber});
  factory CallRequestedClient.fromJson(Map<String, dynamic> json) {
    return CallRequestedClient(
      status: json['is_status_new'],
      typeOfAnItem: json['type_of_item'],
      id: json['id_of_an_item'].toString(),
      clientName: json['client_full_name'],
      clienEmail: json['client_email'],
      phoneNumber: json['phone_number'],
    );
  }
      static List<CallRequestedClient> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => CallRequestedClient.fromJson(json)).toList();
  }
}