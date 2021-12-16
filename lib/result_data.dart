
class ResultData {
  late String code_result;
  late Message code_msg;
  late String data;

  ResultData(
      {required this.code_result, required this.code_msg, required this.data});
  factory ResultData.fromJson(Map<String, dynamic> json){
    return ResultData(code_result: json['code_result'], data: json['data'], code_msg: Message());
  }
}

class Message {
  late String msg;
  late List<String> custom_fields;
}
