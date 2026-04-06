
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
  String? key;
  String? value;
  String? message;
  String? reserved1;
  String? reserved2;
  String? reserved3;

  JSData({this.key, this.value, this.message, this.reserved1, this.reserved2, this.reserved3});

  factory JSData.fromJson(Map<String, dynamic> json) {
    return JSData(
      key: json['key'],
      value: json['value'],
      message: json['message'],
      reserved1: json['reserved1'],
      reserved2: json['reserved2'],
      reserved3: json['reserved3'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'value': value,
      'message': message,
      'reserved1': reserved1,
      'reserved2': reserved2,
      'reserved3': reserved3,
    };
  }
}