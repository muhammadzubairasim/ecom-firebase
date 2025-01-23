class ChatModel {
  String name;
  String? icon;
  String currentMessage;
  String status;
  bool select = false;
  int id;
  ChatModel({
    required this.name,
    this.icon,
    required this.currentMessage,
    required this.status,
    this.select = false,
    required this.id,
  });
}
