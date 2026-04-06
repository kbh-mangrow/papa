
class JSBridgeInterface {
  String command;
  JSData data;

  JSBridgeInterface({
    required this.command,
    required this.data,
  });

  factory JSBridgeInterface.fromJson(Map<String, dynamic> json) {
    return JSBridgeInterface(
      command: json['command'],
      data: JSData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'command': command,
      'data': data.toJson(),
    };
  }
}

class JSData {
  String? message;

  JSData({this.message});

  factory JSData.fromJson(Map<String, dynamic> json) {
    return JSData(
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }
}