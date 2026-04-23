
class JSAuthReq {
  String name;
  String phoneNumber;
  String birth;
  String gender;
  String carrierCode;

  JSAuthReq({
    required this.name,
    required this.phoneNumber,
    required this.birth,
    required this.gender,
    this.carrierCode = "1",
  });

  factory JSAuthReq.fromJson(Map<String, dynamic> json) {
    return JSAuthReq(
      name: json['name'] ?? "",
      phoneNumber: json['phoneNumber'] ?? "",
      birth: json['birth'] ?? "",
      gender: json['gender'] ?? "",
      carrierCode: json['carrierCode'] ?? "1",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phoneNumber": phoneNumber,
      "birth": birth,
      "gender": gender,
      "carrierCode": carrierCode,
    };
  }
}