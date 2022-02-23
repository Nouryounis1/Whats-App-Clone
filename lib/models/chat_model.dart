class ChatModel {
  String? name;
  String? icon;
  bool? isGroup;
  String? time;
  String? currentMessage;
  String? status;
  bool? isSelected = false;

  ChatModel(
      {this.name,
      this.icon,
      this.isGroup,
      this.time,
      this.currentMessage,
      this.status,
      this.isSelected = false});
}
