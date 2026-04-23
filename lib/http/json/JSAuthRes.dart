
class JSAuthRes {
  bool success;
  String requestSequence;
  String responseSequence;
  String errorCode;
  String message;

  JSAuthRes({
    required this.success,
    required this.requestSequence,
    required this.responseSequence,
    required this.errorCode,
    required this.message,
  });

  factory JSAuthRes.fromJson(Map<String, dynamic> json) {
    return JSAuthRes(
      success: json['success'] ?? false,
      requestSequence: json['requestSequence'] ?? "",
      responseSequence: json['responseSequence'] ?? "",
      errorCode: json['errorCode'] ?? "",
      message: json['message'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "success": success,
      "requestSequence": requestSequence,
      "responseSequence": responseSequence,
      "errorCode": errorCode,
      "message": message,
    };
  }
}