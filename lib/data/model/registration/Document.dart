class Document {
  int documentId;
  String documentNumber;
  String expDate;
  String filePath;
  String merchantId;
  String name;
  String type;
  String userId;

  Document(
      {this.documentId,
      this.documentNumber,
      this.expDate,
      this.filePath,
      this.merchantId,
      this.name,
      this.type,
      this.userId});

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      documentId: json['documentId'],
      documentNumber: json['documentNumber'],
      expDate: json['expDate'],
      filePath: json['filePath'],
      merchantId: json['merchantId'],
      name: json['name'],
      type: json['type'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['documentId'] = this.documentId;
    data['documentNumber'] = this.documentNumber;
    data['expDate'] = this.expDate;
    data['filePath'] = this.filePath;
    data['merchantId'] = this.merchantId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['userId'] = this.userId;
    return data;
  }
}
