class CompanyInfo {
  String address1;
  String address2;
  String city;
  String cityName;
  int companyId;
  String country;
  String countryName;
  String domain;
  String email;
  String landmark;
  int lattitude;
  int longitude;
  int maxNoUsersAllowed;
  String merchantId;
  String mobileNumber;
  String name;
  String state;
  String stateName;
  String status;
  String userID;
  String zipCode;

  CompanyInfo(
      {this.address1,
      this.address2,
      this.city,
      this.cityName,
      this.companyId,
      this.country,
      this.countryName,
      this.domain,
      this.email,
      this.landmark,
      this.lattitude,
      this.longitude,
      this.maxNoUsersAllowed,
      this.merchantId,
      this.mobileNumber,
      this.name,
      this.state,
      this.stateName,
      this.status,
      this.userID,
      this.zipCode});

  factory CompanyInfo.fromJson(Map<String, dynamic> json) {
    return CompanyInfo(
      address1: json['address1'],
      address2: json['address2'],
      city: json['city'],
      cityName: json['cityName'],
      companyId: json['companyId'],
      country: json['country'],
      countryName: json['countryName'],
      domain: json['domain'],
      email: json['email'],
      landmark: json['landmark'],
      lattitude: json['lattitude'],
      longitude: json['longitude'],
      maxNoUsersAllowed: json['maxNoUsersAllowed'],
      merchantId: json['merchantId'],
      mobileNumber: json['mobileNumber'],
      name: json['name'],
      state: json['state'],
      stateName: json['stateName'],
      status: json['status'],
      userID: json['userID'],
      zipCode: json['zipCode'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['city'] = this.city;
    data['cityName'] = this.cityName;
    data['companyId'] = this.companyId;
    data['country'] = this.country;
    data['countryName'] = this.countryName;
    data['domain'] = this.domain;
    data['email'] = this.email;
    data['landmark'] = this.landmark;
    data['lattitude'] = this.lattitude;
    data['longitude'] = this.longitude;
    data['maxNoUsersAllowed'] = this.maxNoUsersAllowed;
    data['merchantId'] = this.merchantId;
    data['mobileNumber'] = this.mobileNumber;
    data['name'] = this.name;
    data['state'] = this.state;
    data['stateName'] = this.stateName;
    data['status'] = this.status;
    data['userID'] = this.userID;
    data['zipCode'] = this.zipCode;
    return data;
  }
}
