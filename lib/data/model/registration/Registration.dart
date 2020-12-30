import 'BankDetail.dart';
import 'CompanyInfo.dart';
import 'Document.dart';

class Registration {
  String address1;
  String address2;
  bool allowLocationAccess;
  bool allowPushNotifications;
  String approvalDateTime;
  String approvalStatus;
  BankDetail bankDetail;
  String city;
  String cityName;
  String comment;
  int companyId;
  CompanyInfo companyInfo;
  String country;
  String countryName;
  String dateOfBirth;
  List<Document> documents;
  String emailId;
  String firstName;
  int gender;
  bool isActive;
  bool isEmailVerifed;
  bool isPhoneVerified;
  bool isTNCAccepted;
  String landmark;
  String lastName;
  double lattitude;
  double longitude;
  String merchantId;
  String mobileNumber;
  String password;
  String prefferedLanguage;
  String state;
  String stateName;
  String userID;
  int userInfoId;
  String zipCode;
  String mobileNumberCode;

  Registration(
      {this.address1,
      this.address2,
      this.allowLocationAccess,
      this.allowPushNotifications,
      this.approvalDateTime,
      this.approvalStatus,
      this.bankDetail,
      this.city,
      this.cityName,
      this.comment,
      this.companyId,
      this.companyInfo,
      this.country,
      this.countryName,
      this.dateOfBirth,
      this.documents,
      this.emailId,
      this.firstName,
      this.gender,
      this.isActive,
      this.isEmailVerifed,
      this.isPhoneVerified,
      this.isTNCAccepted,
      this.landmark,
      this.lastName,
      this.lattitude,
      this.longitude,
      this.merchantId,
      this.mobileNumber,
      this.mobileNumberCode,
      this.password,
      this.prefferedLanguage,
      this.state,
      this.stateName,
      this.userID,
      this.userInfoId,
      this.zipCode});

  factory Registration.fromJson(Map<String, dynamic> json) {
    return Registration(
      address1: json['address1'],
      address2: json['address2'],
      allowLocationAccess: json['allowLocationAccess'],
      allowPushNotifications: json['allowPushNotifications'],
      approvalDateTime: json['approvalDateTime'],
      approvalStatus: json['approvalStatus'],
      bankDetail: json['bankDetail'] != null
          ? BankDetail.fromJson(json['bankDetail'])
          : null,
      city: json['city'],
      cityName: json['cityName'],
      comment: json['comment'],
      companyId: json['companyId'],
      companyInfo: json['companyInfo'] != null
          ? CompanyInfo.fromJson(json['companyInfo'])
          : null,
      country: json['country'],
      countryName: json['countryName'],
      dateOfBirth: json['dateOfBirth'],
      documents: json['documents'] != null
          ? (json['documents'] as List)
              .map((i) => Document.fromJson(i))
              .toList()
          : null,
      emailId: json['emailId'],
      firstName: json['firstName'],
      gender: json['gender'],
      isActive: json['isActive'],
      isEmailVerifed: json['isEmailVerifed'],
      isPhoneVerified: json['isPhoneVerified'],
      isTNCAccepted: json['isTNCAccepted'],
      landmark: json['landmark'],
      lastName: json['lastName'],
      lattitude: json['lattitude'],
      longitude: json['longitude'],
      merchantId: json['merchantId'],
      mobileNumber: json['mobileNumber'],
      mobileNumberCode: json['mobileNumberCode'],
      password: json['password'],
      prefferedLanguage: json['prefferedLanguage'],
      state: json['state'],
      stateName: json['stateName'],
      userID: json['userID'],
      userInfoId: json['userInfoId'],
      zipCode: json['zipCode'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['allowLocationAccess'] = this.allowLocationAccess;
    data['allowPushNotifications'] = this.allowPushNotifications;
    data['approvalDateTime'] = this.approvalDateTime;
    data['approvalStatus'] = this.approvalStatus;
    data['city'] = this.city;
    data['cityName'] = this.cityName;
    data['comment'] = this.comment;
    data['companyId'] = this.companyId;
    data['country'] = this.country;
    data['countryName'] = this.countryName;
    data['dateOfBirth'] = this.dateOfBirth;
    data['emailId'] = this.emailId;
    data['firstName'] = this.firstName;
    data['gender'] = this.gender;
    data['isActive'] = this.isActive;
    data['isEmailVerifed'] = this.isEmailVerifed;
    data['isPhoneVerified'] = this.isPhoneVerified;
    data['isTNCAccepted'] = this.isTNCAccepted;
    data['landmark'] = this.landmark;
    data['lastName'] = this.lastName;
    data['lattitude'] = this.lattitude;
    data['longitude'] = this.longitude;
    data['merchantId'] = this.merchantId;
    data['mobileNumber'] = this.mobileNumber;
    data['MobileNumberCode'] = this.mobileNumberCode;
    data['password'] = this.password;
    data['prefferedLanguage'] = this.prefferedLanguage;
    data['state'] = this.state;
    data['stateName'] = this.stateName;
    data['userID'] = this.userID;
    data['userInfoId'] = this.userInfoId;
    data['zipCode'] = this.zipCode;
    if (this.bankDetail != null) {
      data['bankDetail'] = this.bankDetail.toJson();
    }
    if (this.companyInfo != null) {
      data['companyInfo'] = this.companyInfo.toJson();
    }
    if (this.documents != null) {
      data['documents'] = this.documents.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
