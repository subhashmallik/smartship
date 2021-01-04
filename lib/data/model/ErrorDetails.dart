class ErrorDetails {
  String additionalProp1;
  String additionalProp2;
  String additionalProp3;
  String message;

  ErrorDetails(
      {this.additionalProp1,
      this.additionalProp2,
      this.additionalProp3,
      this.message});

  factory ErrorDetails.fromJson(Map<String, dynamic> json) {
    return ErrorDetails(
      additionalProp1: json['additionalProp1'],
      additionalProp2: json['additionalProp2'],
      additionalProp3: json['additionalProp3'],
      message: json['Message'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['additionalProp1'] = this.additionalProp1;
    data['additionalProp2'] = this.additionalProp2;
    data['additionalProp3'] = this.additionalProp3;
    data['Message'] = this.message;
    return data;
  }

  @override
  String toString() {
    return 'ErrorDetails{additionalProp1: $additionalProp1, additionalProp2: $additionalProp2, additionalProp3: $additionalProp3, message: $message}';
  }
}
