class ContactMeMessage {
  final String clientFullName;
  final String clientEmail;
  final String clientSubjectOfMessage;
  final String clienFullMessage;
  final String id;

  const ContactMeMessage(
      {required this.clientFullName,
      required this.clientEmail,
      required this.clientSubjectOfMessage,
      required this.clienFullMessage,
      required this.id});

  factory ContactMeMessage.fromJson(Map<String, dynamic> json) {
    return ContactMeMessage(
      clientFullName: json['client_full_name'],
      clientEmail: json['client_email'],
      clientSubjectOfMessage: json['client_subject'],
      clienFullMessage: json['client_message'],
      id: json['id'].toString(),
    );
  }
  static List<ContactMeMessage> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ContactMeMessage.fromJson(json)).toList();
  }
}
