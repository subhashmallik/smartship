class Entity {
  String merchantId;
  String name;
  String token;
  String userID;
  String userActivationId;

  Entity(
      {this.merchantId,
      this.name,
      this.token,
      this.userID,
      this.userActivationId});

  factory Entity.fromJson(Map<String, dynamic> json) {
    return Entity(
      merchantId: json['merchantId'],
      name: json['name'],
      token: json['token'],
      userID: json['userID'],
      userActivationId: json['UserActivationId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['merchantId'] = this.merchantId;
    data['name'] = this.name;
    data['token'] = this.token;
    data['userID'] = this.userID;
    return data;
  }
}
