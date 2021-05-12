class Message {
  String text;
  bool isUpvoted;
  int upvotes;
  String sentBy;

  Message({this.text, this.isUpvoted, this.upvotes, this.sentBy});

  Message.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    isUpvoted = json['isUpvoted'];
    upvotes = json['upvotes'];
    sentBy = json['sentBy'];
  }
}
