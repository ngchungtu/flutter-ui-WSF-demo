class UserModel {

  int? userId;
  int? id;
  String? title;
  String? body;

  UserModel({
      this.userId,
      this.id,
      this.title,
      this.body,});

  UserModel.fromJson(dynamic json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['id'] = id;
    map['title'] = title;
    map['body'] = body;
    return map;
  }
}