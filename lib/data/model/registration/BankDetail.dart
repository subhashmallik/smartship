class BankDetail {
  String accountID;
  String accountName;
  String bankName;
  String branch;
  String city;
  String country;
  int iD;
  String iFSC;
  int masterBankId;
  String merchantId;
  String pGToken;
  String userID;

  BankDetail(
      {this.accountID,
      this.accountName,
      this.bankName,
      this.branch,
      this.city,
      this.country,
      this.iD,
      this.iFSC,
      this.masterBankId,
      this.merchantId,
      this.pGToken,
      this.userID});

  factory BankDetail.fromJson(Map<String, dynamic> json) {
    return BankDetail(
      accountID: json['accountID'],
      accountName: json['accountName'],
      bankName: json['bankName'],
      branch: json['branch'],
      city: json['city'],
      country: json['country'],
      iD: json['iD'],
      iFSC: json['iFSC'],
      masterBankId: json['masterBankId'],
      merchantId: json['merchantId'],
      pGToken: json['pGToken'],
      userID: json['userID'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accountID'] = this.accountID;
    data['accountName'] = this.accountName;
    data['bankName'] = this.bankName;
    data['branch'] = this.branch;
    data['city'] = this.city;
    data['country'] = this.country;
    data['iD'] = this.iD;
    data['iFSC'] = this.iFSC;
    data['masterBankId'] = this.masterBankId;
    data['merchantId'] = this.merchantId;
    data['pGToken'] = this.pGToken;
    data['userID'] = this.userID;
    return data;
  }
}
