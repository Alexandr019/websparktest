class SendResponseModel {
  const SendResponseModel({required this.error, required this.message});

  factory SendResponseModel.fromJson(Map<String, dynamic> json) {
    return SendResponseModel(error: json['error'] as bool, message: json['message'] as String);
  }

  final bool error;
  final String message;
}
